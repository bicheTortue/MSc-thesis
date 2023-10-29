Rmin = 10**4
Rmax = 10**6
Rf = (Rmax + Rmin) / 2


def wei2res(w):
    Rpos = (w + 1 - np.sqrt(w**2 + 1)) * Rf / w
    Rpos = float("%.2g" % Rpos)
    Rneg = 2 * Rf - Rpos
    return (Rpos, Rneg)
