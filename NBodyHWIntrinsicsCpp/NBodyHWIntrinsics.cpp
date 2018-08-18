
#include "NBodyHWIntrinsics.h"


NBody::~NBody()
{
}

void NBody::Initialize()
{
    uint64_t alignOffset = (uint64_t)this % 16;
    uint64_t dataAddr = alignOffset == 0 ? (uint64_t)this : (uint64_t)this + (16 - alignOffset);
    double* dataPtr = (double*)(dataAddr);

    XPtr = dataPtr;
    YPtr = (double*)(dataAddr + YOffset);
    ZPtr = (double*)(dataAddr + ZOffset);
    VxPtr = (double*)(dataAddr + VXOffset);
    VyPtr = (double*)(dataAddr + VYOffset);
    VzPtr = (double*)(dataAddr + VZOffset);
    MPtr = (double*)(dataAddr + MOffset);

    XPtr[2] = 4.84143144246472090e+00;
    XPtr[3] = 8.34336671824457987e+00;
    XPtr[4] = 1.28943695621391310e+01;
    XPtr[5] = 1.53796971148509165e+01;

    YPtr[2] = -1.16032004402742839e+00;
    YPtr[3] = 4.12479856412430479e+00;
    YPtr[4] = -1.51111514016986312e+01;
    YPtr[5] = -2.59193146099879641e+01;

    ZPtr[2] = -1.03622044471123109e-01;
    ZPtr[3] = -4.03523417114321381e-01;
    ZPtr[4] = -2.23307578892655734e-01;
    ZPtr[5] = 1.79258772950371181e-01;

    VxPtr[2] = 1.66007664274403694e-03;
    VxPtr[3] = -2.76742510726862411e-03;
    VxPtr[4] = 2.96460137564761618e-03;
    VxPtr[5] = 2.68067772490389322e-03;

    VyPtr[2] = 7.69901118419740425e-03;
    VyPtr[3] = 4.99852801234917238e-03;
    VyPtr[4] = 2.37847173959480950e-03;
    VyPtr[5] = 1.62824170038242295e-03;

    VzPtr[2] = -6.90460016972063023e-05;
    VzPtr[3] = 2.30417297573763929e-05;
    VzPtr[4] = -2.96589568540237556e-05;
    VzPtr[5] = -9.51592254519715870e-05;

    MPtr[0] = Solarmass;

    __m128d vx = _mm_setzero_pd();
    __m128d vy = _mm_setzero_pd();
    __m128d vz = _mm_setzero_pd();
    __m128d yearInDays = _mm_set1_pd(DaysPerYear);
    __m128d mSol = _mm_set1_pd(Solarmass);

    double mInitData[] = { 9.54791938424326609e-04, 2.85885980666130812e-04, 4.36624404335156298e-05, 5.15138902046611451e-05 };

    for (int i = 2; i < 6; i += 2)
    {
        __m128d vxV = _mm_load_pd(VxPtr + i);
        __m128d vyV = _mm_load_pd(VyPtr + i);
        __m128d vzV = _mm_load_pd(VzPtr + i);

        // Initialize v(xyz) vectors
        vxV = _mm_mul_pd(vxV, yearInDays);
        vyV = _mm_mul_pd(vyV, yearInDays);
        vzV = _mm_mul_pd(vzV, yearInDays);

        // Initialize mV vector
        __m128d mV = _mm_set_pd(mInitData[i - 1], mInitData[i - 2]);  // Verify order
        mV = _mm_mul_pd(mV, mSol);

        // Try to use RM second op overload
        vx = _mm_add_pd(vx, _mm_mul_pd(mV, vxV));
        vy = _mm_add_pd(vy, _mm_mul_pd(mV, vyV));
        vz = _mm_add_pd(vz, _mm_mul_pd(mV, vzV));

        // Save mV vector
        _mm_store_pd(MPtr + i, mV);

        // Save initialized v(xyz) vectors
        _mm_store_pd(VxPtr + i, vxV);
        _mm_store_pd(VyPtr + i, vyV);
        _mm_store_pd(VzPtr + i, vzV);

    }

    vx = _mm_hadd_pd(vx, vy);
    vx = _mm_div_pd(vx, mSol);
    vz = _mm_hadd_pd(vz, vz);
    vz = _mm_div_pd(vz, mSol);

    VxPtr[0] = _mm_cvtsd_f64(vx);
    vx = _mm_castsi128_pd(_mm_bsrli_si128(_mm_castpd_si128(vx), 8));
    VyPtr[0] = _mm_cvtsd_f64(vx);
    VzPtr[0] = _mm_cvtsd_f64(vz);
};

double NBody::Energy()
{
    double result = 0.0;
    double
        *xPtr = XPtr,
        *yPtr = YPtr,
        *zPtr = ZPtr,
        *vxPtr = VxPtr,
        *vyPtr = VyPtr,
        *vzPtr = VzPtr,
        *mPtr = MPtr;

    __m128d resultV = _mm_setzero_pd();
    __m128d div2V = _mm_set1_pd(0.5);

    // Calls for optimization - use intstruction level parallelizm
    for (int i = 0, k = 2; i < 6; i += 2, mPtr += 2, vxPtr += 2, vyPtr += 2, vzPtr += 2, xPtr += 2, yPtr += 2, zPtr += 2)
    {
        __m128d mV = _mm_load_pd(mPtr);
        __m128d vxV = _mm_load_pd(vxPtr);
        __m128d vyV = _mm_load_pd(vyPtr);
        __m128d vzV = _mm_load_pd(vzPtr);

        vxV = _mm_mul_pd(vxV, vxV);
        vyV = _mm_mul_pd(vyV, vyV);
        vzV = _mm_mul_pd(vzV, vzV);

        vxV = _mm_add_pd(vxV, vyV);
        vxV = _mm_add_pd(vxV, vzV);

        vxV = _mm_mul_pd(vxV, mV);
        vxV = _mm_mul_pd(div2V, vxV);
        resultV = _mm_add_pd(resultV, vxV);

        __m128d xV = _mm_load_pd(xPtr);
        __m128d yV = _mm_load_pd(yPtr);
        __m128d zV = _mm_load_pd(zPtr);

        for (int z = 0; z < 2; z++, k++)
        {
            if (z == 1 && k == 3)
            {
                break;
            }

            if (z == 0)
            {
                vxV = _mm_unpacklo_pd(mV, mV);
            }
            else
            {
                vxV = _mm_unpackhi_pd(mV, mV);
            }

            resultV = EnergyInner(resultV, k, vxV, xV, yV, zV);
        }
    }

    resultV = _mm_hadd_pd(resultV, resultV);
    result = _mm_cvtsd_f64(resultV);

    return result;
};

__m128d NBody::EnergyInner(__m128d resultV, int k, __m128d mV, __m128d xV, __m128d yV, __m128d zV)
{
    // Calls for optimization - use intstruction level parallelizm
    for (int j = k; j < 6; j += 2)
    {
        __m128d mLow = _mm_loadu_pd(MPtr + j);
        __m128d xLow = _mm_loadu_pd(XPtr + j);
        __m128d yLow = _mm_loadu_pd(YPtr + j);
        __m128d zLow = _mm_loadu_pd(ZPtr + j);

        xLow = _mm_sub_pd(xV, xLow);
        yLow = _mm_sub_pd(yV, yLow);
        zLow = _mm_sub_pd(zV, zLow);

        mLow = _mm_mul_pd(mLow, mV);
        xLow = _mm_mul_pd(xLow, xLow);
        yLow = _mm_mul_pd(yLow, yLow);
        zLow = _mm_mul_pd(zLow, zLow);
        xLow = _mm_add_pd(xLow, yLow);
        xLow = _mm_add_pd(zLow, xLow);

        // Avoid very expensive Sqrt and Divide by replacing
        // them with ReciprocalSqrt and Multiplication. Use custom
        // double rsqrt implementation - intrinsics are missing double rsqrt
        // Custom rsqrt - 12.38 CPI, mul 0.5 / 1.0 CPI
        // Sse2 sqrt - 14 CPI, div 14.0 CPI (much faster on Broadwell / Skylake)
        // Instruction level parallelizm cannot be exploited:
        // latencies are always in range: div 14 - 20, sqrt 18 - 20
        yLow = ReciprocalSqrt(xLow);
        mLow = _mm_mul_pd(mLow, yLow);

        // Eliminate end of loop last column for j == 5
        // otherwise Solar data are computed multiple times
        if (j != 5)
        {
            resultV = _mm_sub_pd(resultV, mLow);
        }
        else
        {
            double e = _mm_cvtsd_f64(mLow);
            resultV = _mm_sub_pd(resultV, _mm_set_pd(e, 0)); // Param order
        }
    }
    return resultV;
}

void NBody::Advance(int count, double distance)
{
    __m128d disV = _mm_set1_pd(distance);

    while (count-- > 0)
    {
        double
            *xPtr = XPtr,
            *yPtr = YPtr,
            *zPtr = ZPtr,
            *vxPtr = VxPtr,
            *vyPtr = VyPtr,
            *vzPtr = VzPtr,
            *mPtr = MPtr;

        for (int i = 0, k = 2; i < 6; i++, k++, mPtr++, vxPtr++, vyPtr++, vzPtr++, xPtr++, yPtr++, zPtr++)
        {
            __m128d mV = _mm_loaddup_pd(mPtr);
            __m128d xV = _mm_loaddup_pd(xPtr);
            __m128d yV = _mm_loaddup_pd(yPtr);
            __m128d zV = _mm_loaddup_pd(zPtr);
            __m128d vxV = _mm_loaddup_pd(vxPtr);
            __m128d vyV = _mm_loaddup_pd(vyPtr);
            __m128d vzV = _mm_loaddup_pd(vzPtr);

            for (int j = (k - k % 2); j < 6; j += 2)
            {
                __m128d xxV = _mm_load_pd(XPtr + j);
                __m128d yyV = _mm_load_pd(YPtr + j);
                __m128d zzV = _mm_load_pd(ZPtr + j);

                xxV = _mm_mul_pd(xxV, xV);
                yyV = _mm_mul_pd(yyV, yV);
                zzV = _mm_mul_pd(zzV, zV);

                __m128d mag = Get2D(xxV, yyV, zzV);
                mag = _mm_mul_pd(Reciprocal(mag), ReciprocalSqrt(mag));
                mag = _mm_mul_pd(mag, disV);

                __m128d imag = _mm_mul_pd(mV, mag);
                _mm_store_pd(VxPtr + j, _mm_sub_pd(_mm_load_pd(VxPtr + j), _mm_mul_pd(imag, xxV)));
                _mm_store_pd(VyPtr + j, _mm_sub_pd(_mm_load_pd(VyPtr + j), _mm_mul_pd(imag, yyV)));
                _mm_store_pd(VzPtr + j, _mm_sub_pd(_mm_load_pd(VzPtr + j), _mm_mul_pd(imag, zzV)));

                __m128d jmag = _mm_mul_pd(_mm_load_pd(MPtr + j), mag);
                vxV = _mm_add_pd(vxV, _mm_mul_pd(jmag, xxV));
                vyV = _mm_add_pd(vyV, _mm_mul_pd(jmag, yyV));
                vzV = _mm_add_pd(vzV, _mm_mul_pd(jmag, zzV));
            } // inner loop

            _mm_store_sd(vxPtr, _mm_hadd_pd(vxV, vxV));
            _mm_store_sd(vxPtr, _mm_hadd_pd(vxV, vxV));
            _mm_store_sd(vxPtr, _mm_hadd_pd(vxV, vxV));

            xV = _mm_add_pd(xV, _mm_mul_pd(vxV, disV));
            yV = _mm_add_pd(yV, _mm_mul_pd(vyV, disV));
            zV = _mm_add_pd(zV, _mm_mul_pd(vzV, disV));

            _mm_store_sd(xPtr, _mm_hadd_pd(xV, xV));
            _mm_store_sd(yPtr, _mm_hadd_pd(yV, yV));
            _mm_store_sd(zPtr, _mm_hadd_pd(zV, zV));

            if (i == 0)
            {
                i++;
            }

        } // outer loop

        //*(xPtr - 1) += (*(vxPtr - 1) * distance);
        //*(yPtr - 1) += (*(vyPtr - 1) * distance);
        //*(zPtr - 1) += (*(vzPtr - 1) * distance);
    } // advance loop
}

int main(int argc, char** argv)
{
    int count = argc >= 2 ? atoi(argv[1]) : 50000000;
    NBody nBody;
    nBody.Initialize();
    printf("%.9f\n", nBody.Energy());
    nBody.Advance(count, 0.01);
    printf("%.9f\n", nBody.Energy());
}
