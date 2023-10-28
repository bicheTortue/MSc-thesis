def smooth_line(df, n):
    size = len(df)
    out = df.copy()
    for i in range(size):
        if (i < n):
            out[i] = df[0:i+n].mean()
        elif (size-i-1 < n):
            out[i] = df[i-n:size-1].mean()
        else:
            out[i] = df[i-n:i+n].mean()
    return out
