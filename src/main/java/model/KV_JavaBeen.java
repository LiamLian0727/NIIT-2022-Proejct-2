package model;

public class KV_JavaBeen {
    private String K, V;

    public KV_JavaBeen() {
    }

    public KV_JavaBeen(String k, String v) {
        K = k;
        V = v;
    }

    public String getK() {
        return K;
    }

    public void setK(String k) {
        K = k;
    }

    public String getV() {
        return V;
    }

    public void setV(String v) {
        V = v;
    }

    @Override
    public String toString() {
        return K + " : " + V;
    }
}
