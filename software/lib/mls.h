


class mls_measure
{

public :
    void GeneratetagS(bool *mls, long *tagS, long P, long N);
    void GeneratetagL(bool *mls, long *tagL, long P, long N);
    void PermuteResponse(double *perm, double *resp, long *tagL, long P);
    void PermuteSignal(double *sig, double *perm, long *tagS, long P);
    void FastHadamard(double *x, long P1, long N);
    void GenerateMls(bool *mls, long P, long N);
    void GenerateSignal(bool *mls, double *signal, long P, double gain);
    static const int left=0;
    static const int right=1;
    static const int both=3;
    void GenerateWaveFile(double *signal, long P, int channel, int repeat, std::string filename);
    void RotateResponse(double *inresp, double *outresp, long P);
};
