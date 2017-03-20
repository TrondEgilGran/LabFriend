#include <stdio.h>
#include <string>
#include <fstream>
#include <iostream>
#include "mls.h"
using namespace std;




void mls_measure::GenerateSignal(bool *mls, double *signal, int32_t P, double gain)
{
    int32_t i;

    for (i = 0; i < P; i++) // Change 0 to 1 and 1 to -1
    {
        signal[i] = (-2 * mls[i] + 1)*gain;
    }

}

namespace little_endian_io
{
  template <typename Word>
  std::ostream& write_word( std::ostream& outs, Word value, unsigned size = sizeof( Word ) )
  {
    for (; size; --size, value >>= 8)
      outs.put( static_cast <char> (value & 0xFF) );
    return outs;
  }
}
using namespace little_endian_io;
void mls_measure::GenerateWaveFile(double *signal, int32_t P, int channel,int repeat, std::string filename)
{
    int32_t i;
    int left_chan, right_can;


    ofstream f( filename.c_str(), ios::binary );

    // Write the file headers
    f << "RIFF----WAVEfmt ";     // (chunk size to be filled in later)
    write_word( f,     16, 4 );  // no extension data
    write_word( f,      1, 2 );  // PCM - integer samples
    write_word( f,      2, 2 );  // two channels (stereo file)
    write_word( f,  44100, 4 );  // samples per second (Hz)
    write_word( f, 176400, 4 );  // (Sample Rate * BitsPerSample * Channels) / 8
    write_word( f,      4, 2 );  // data block size (size of two integer samples, one for each channel, in bytes)
    write_word( f,     16, 2 );  // number of bits per sample (use a multiple of 8)

    size_t data_chunk_pos = f.tellp();
    f << "data----";  // (chunk size to be filled in later)
    while(repeat--)
    {
        for (i = 0; i < P; i++) // Change 0 to 1 and 1 to -1
        {
            if(channel == left)
            {
                left_chan = 32760 * signal[i];
                right_can = 0;
            }
            else if(channel == right)
            {
                left_chan = 0;
                right_can = 32760 * signal[i];
            }
            else if(channel == both)
            {
                right_can = 32760 * signal[i];
                left_chan = 32760 * signal[i];
            }
            write_word( f, left_chan, 2 );
            write_word( f, right_can, 2 );
        }
     }
    size_t file_length = f.tellp();
    f.seekp( data_chunk_pos + 4 );
    write_word( f, file_length - data_chunk_pos + 8 );
    f.seekp( 0 + 4 );
    write_word( f, file_length - 8, 4 );
}

void mls_measure::GenerateMls(bool *mls, int32_t P, int32_t N)
{
    const int32_t maxNoTaps = 18;
    const bool tapsTab[16][18] = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0,
        0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0,
        0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    bool taps[maxNoTaps];
    int32_t i, j;
    bool *delayLine = new bool[maxNoTaps];
    int32_t sum;
    for (i = 0; i < N; i++) // copy the N’th taps table
    {
        taps[i] = tapsTab[maxNoTaps - N][i];
        delayLine[i] = 1;
    }
    for (i = 0; i < P; i++) // Generate an MLS by summing the taps mod 2
    {
        sum = 0;
        for (j = 0; j < N; j++)
        {
            sum += taps[j] * delayLine[j];
        }

        sum &= 1; // mod 2
        mls[i] = delayLine[N - 1];
        for (j = N - 2; j >= 0; j--)
        {
            delayLine[j + 1] = delayLine[j];
        }
        delayLine[0] = *(bool*)&sum;
    }
    delete []delayLine;
}
void mls_measure::FastHadamard(double *x, int32_t P1, int32_t N)
{
    int32_t i, i1, j, k, k1, k2;
    double temp;

    k1 = P1;

    for (k = 0; k < N; k++)
    {
        k2 = k1 >> 1;
        for (j = 0; j < k2; j++)
        {
            for (i = j; i < P1; i = i + k1)
            {
                i1 = i + k2;
                temp = x[i] + x[i1];
                x[i1] = x[i] - x[i1];
                x[i] = temp;
            }
        }
        k1 = k1 >> 1;
    }
}
void mls_measure::PermuteSignal(double *sig, double *perm, int32_t *tagS, int32_t P)
{
    int32_t i;
    double dc = 0;

    for (i = 0; i < P; i++)
        dc += sig[i];

    perm[0] = -dc;

    for (i = 0; i < P; i++) // Just a permutation of the measured signal
        perm[tagS[i]] = sig[i];
}
void mls_measure::PermuteResponse(double *perm, double *resp, int32_t *tagL, int32_t P)
{
    int32_t i;
    const double fact = 1 / double(P + 1);
    for (i = 0; i < P; i++) // Just a permutation of the impulse response
    {
        resp[i] = perm[tagL[i]] * fact;
    }
    resp[P] = 0;
}

void mls_measure::RotateResponse(double *inresp, double *outresp, int32_t P)
{
    int32_t i;
    int32_t MidPoint;

    MidPoint = (P) >> 1;

    for(i=0; i < P; i++)
    {
        if(i < MidPoint) outresp[MidPoint+i+1] = inresp[i];
        else outresp[i-MidPoint] = inresp[i];
    }

}

void mls_measure::GeneratetagL(bool *mls, int32_t *tagL, int32_t P, int32_t N)
{
    int32_t i, j;
    int32_t *colSum = new int32_t[P];
    int32_t *index = new int32_t[N];
    for (i = 0; i < P; i++) // Run through all the columns in the autocorr matrix
    {
        colSum[i] = 0;
        for (j = 0; j < N; j++) // Find colSum as the value of the first N elements regarded as a binary number
        {
            colSum[i] += mls[(P + i - j) % P] << (N - 1 - j);
        }
        for ( j = 0; j < N; j++) // Figure out if colSum is a 2^j number and store the column as the j’th index
        {
            if (colSum[i] == (1 << j))
            index[j] = i;
        }
    }
    for (i = 0; i < P; i++) // For each row in the L matrix
    {
        tagL[i] = 0;
    for ( j = 0; j < N; j++) // Find the tagL as the value of the rows in the L matrix regarded as a binary number
    {
        tagL[i] += mls[(P + index[j] - i) % P] * (1 << j);
    }
    }
    delete []colSum;
    delete []index;
}

void mls_measure::GeneratetagS(bool *mls, int32_t *tagS, int32_t P, int32_t N)
{
    int32_t i, j;
    for (i = 0; i < P; i++) // For each column in the S matrix
    {
        tagS[i] = 0;
        for (j = 0; j < N; j++) // Find the tagS as the value of the columns in the S matrix regarded as a binary number
        {
            tagS[i] += mls[(P + i - j) % P] * (1 << (N - 1 - j));
        }
    }
}
//#define HAVE_MAIN
#ifdef HAVE_MAIN
int main()
{
    const int32_t N = 10;
    const int32_t P = (1 << N) - 1;
    int32_t i;
    bool *mls = new bool[P];
    int32_t *tagL = new int32_t[P];
    int32_t *tagS = new int32_t[P];
    double *signal = new double[P];
    double *perm = new double[P + 1];
    double *resp = new double[P + 1];
    mls_measure mls1;

    mls1.GenerateMls(mls, P, N); // Generate the Maximum length sequence
    mls1.GeneratetagL(mls, tagL, P, N); // Generate tagL for the L matrix
    mls1.GeneratetagS(mls, tagS, P, N); // Generate tagS for the S matrix
    mls1.GenerateSignal(mls, signal, P, 0.5); // Do a simulated measurement and get the signal
    mls1.GenerateWaveFile(signal, P, mls1.both, 900, "supwe.wav");
    mls1.PermuteSignal(signal, perm, tagS, P); // Permute the signal according to tagS
    mls1.FastHadamard(perm, P + 1, N); // Do a Hadamard transform in place
    mls1.PermuteResponse(perm, resp, tagL, P); // Permute the impulseresponse according to tagL

    printf("Impulse response:\n");
    for (i = 0; i < 100; i++)
        printf("%10.5f\n", signal[i]);

    delete []mls;
    delete []tagL;
    delete []tagS;
    delete []signal;
    delete []perm;
    delete []resp;

    return 0;
}
#endif
