#pragma once

#ifndef NBODY_H
#define NBODY_H


#include <immintrin.h>
#include <iostream>
#include <cstdlib>
#include <cstring>

const int Length = 8;
const int XOffset = 0;
const int YOffset = 1 * Length * sizeof(double);
const int ZOffset = 2 * Length * sizeof(double);
const int VXOffset = 3 * Length * sizeof(double);
const int VYOffset = 4 * Length * sizeof(double);
const int VZOffset = 5 * Length * sizeof(double);
const int MOffset = 6 * Length * sizeof(double);
const int XPtrOffset = 7 * Length * sizeof(double);
const int YPtrOffset = XPtrOffset + sizeof(double);
const int ZPtrOffset = YPtrOffset + sizeof(double);
const int VxPtrOffset = ZPtrOffset + sizeof(double);
const int VyPtrOffset = VxPtrOffset + sizeof(double);
const int VzPtrOffset = VyPtrOffset + sizeof(double);
const int MPtrOffset = VzPtrOffset + sizeof(double);

const int NBodySize = MPtrOffset + 8;

const double Pi = 3.141592653589793;
const double Solarmass = 4 * Pi * Pi;
const double DaysPerYear = 365.24;


class NBody
{
public:
    ~NBody();

public:
    double x[Length];
    double y[Length];
    double z[Length];
    double vx[Length];
    double vy[Length];
    double vz[Length];
    double m[Length];
    double* XPtr;
    double* YPtr;
    double* ZPtr;
    double* VxPtr;
    double* VyPtr;
    double* VzPtr;
    double* MPtr;

    NBody()
    {
        memset(x, 0, 32);
        memset(y, 0, 32);
        memset(z, 0, 32);
        memset(vx, 0, 32);
        memset(vy, 0, 32);
        memset(vz, 0, 32);
        memset(m, 0, 32);
    }

    void Initialize();

    double Energy();

    __m128d EnergyInner(__m128d resultV, int k, __m128d mV, __m128d xV, __m128d yV, __m128d zV);

    void Advance(int count, double distance);

    static __m128d Get2D(__m128d dx, __m128d dy, __m128d dz)
    {
        dx = _mm_mul_pd(dx, dx);
        dy = _mm_mul_pd(dy, dy);
        dz = _mm_mul_pd(dz, dz);
        dx = _mm_add_pd(dx, dy);
        dz = _mm_add_pd(dx, dz);
        return dz;
    }

    static __m128d Reciprocal(__m128d value)
    {
        __m128d one = _mm_set1_pd(1.0);
        __m128d x = _mm_cvtps_pd(_mm_rcp_ps(_mm_cvtpd_ps(value)));
        __m128d r = _mm_sub_pd(one, _mm_mul_pd(value, x));
        __m128d r2 = _mm_mul_pd(r, r);
        __m128d r1 = _mm_add_pd(r, one);
        __m128d r21 = _mm_add_pd(r2, one);
        __m128d poly = _mm_mul_pd(r1, r21);
        __m128d res = _mm_mul_pd(poly, x);
        return res;
    }

    static __m128d ReciprocalSqrt(__m128d value)
    {
        __m128d one = _mm_set1_pd(1.0), c1 = _mm_set1_pd(1.0 / 2.0), c2 = _mm_set1_pd(3.0 / 8.0), c3 = _mm_set1_pd(15.0 / 48.0);
        __m128d x = _mm_cvtps_pd(_mm_rsqrt_ps(_mm_cvtpd_ps(value)));
        __m128d r = _mm_sub_pd(one, _mm_mul_pd(_mm_mul_pd(value, x), x));
        __m128d r2 = _mm_mul_pd(r, r);
        __m128d t1 = _mm_add_pd(_mm_mul_pd(c2, r), c1);
        __m128d poly = _mm_add_pd(_mm_mul_pd(r2, c3), t1);
        __m128d res = _mm_add_pd(_mm_mul_pd(_mm_mul_pd(x, r), poly), x);
        return res;
    }
};

#endif // !NBODY_H
#undef NBODY_H
