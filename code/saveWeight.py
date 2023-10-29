import pickle

import tensorflow as tf
from tensorflow.keras.layers import Layer
from tensorflow.keras.layers import Dense, LSTM, GRU
from keras.layers import TimeDistributed


def getLSTMWeights(lstm, nbHidden):
    W, U, b = lstm.get_weights()
    nbGates = 4
    out = [None] * nbGates

    for i in range(nbGates):
        out[i] = []
        for j in range(nbHidden):
            out[i].extend(W[:, i * nbGates + j])
            out[i].extend(U[:, i * nbGates + j])
            out[i].append(b[i * nbGates + j])
    return out


def getGRUWeights(layer, nbHidden):
    W, U, b = layer.get_weights()
    nbGates = 3
    out = [None] * nbGates

    for i in range(nbGates):
        out[i] = []
        for j in range(nbHidden):
            out[i].extend(W[:, i * nbGates + j])
            out[i].extend(U[:, i * nbGates + j])
            out[i].append(b[i * nbGates + j])
    return out


def getDenseWeights(nn, nbOutput):
    W = nn.get_weights()[0]
    b = list(nn.get_weights()[1])
    out = []
    for i in range(nbOutput):
        out.extend(W[:, i])
        out.append(b[i])
    return out


def saveTofile(layers, filename):
    out = [[]]
    for layer in layers:
        if type(layer) == TimeDistributed:
            nbOut = layer.output_shape[-1]
            out[0].append("tDense(" + str(nbOut) + ")")
            out.append(getDenseWeights(layer, nbOut))
        elif type(layer) == Dense:
            nbOut = layer.output_shape[1]
            out[0].append("Dense(" + str(nbOut) + ")")
            out.append(getDenseWeights(layer, nbOut))
        elif type(layer) == LSTM:
            nbHid = layer.units
            out[0].append("LSTM(" + str(nbHid) + ")")
            out.append(getLSTMWeights(layer, nbHid))
        elif type(layer) == GRU:
            nbHid = layer.units
            out[0].append("GRU(" + str(nbHid) + ")")
            out.append(getGRUWeights(layer, nbHid))

    with open(filename, "wb") as file:  # Pickling
        pickle.dump(out, file)
