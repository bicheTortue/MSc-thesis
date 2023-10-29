def smooth_line(df, n):
    size = len(df)
    out = df.copy()
    for i in range(size):
        if i < n:
            out[i] = mean(df[0 : i + n])
        elif size - i - 1 < n:
            out[i] = mean(df[i - n : size - 1])
        else:
            out[i] = mean(df[i - n : i + n])
    return out
