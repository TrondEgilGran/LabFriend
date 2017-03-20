


class mls_measure
{

public :
    void GeneratetagS(bool *mls, int32_t *tagS, int32_t P, int32_t N);
    void GeneratetagL(bool *mls, int32_t *tagL, int32_t P, int32_t N);
    void PermuteResponse(double *perm, double *resp, int32_t *tagL, int32_t P);
    void PermuteSignal(double *sig, double *perm, int32_t *tagS, int32_t P);
    void FastHadamard(double *x, int32_t P1, int32_t N);
    void GenerateMls(bool *mls, int32_t P, int32_t N);
    void GenerateSignal(bool *mls, double *signal, int32_t P, double gain);
    static const int left=0;
    static const int right=1;
    static const int both=3;
    void GenerateWaveFile(double *signal, int32_t P, int channel, int repeat, std::string filename);
    void RotateResponse(double *inresp, double *outresp, int32_t P);
};
