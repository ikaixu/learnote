#潜在基因识别问题
import sys
import stdio

def isPotientialGene(dna):
    #number of bases is a multiple of 3
    if (len(dna) % 3) != 0: return False

    # starts with start codon
    if not dna.startswitch('ATG'): return False

    # no intervening stop codons
    for i in range(len(dna) - 3):
        if i % 3 == 0:
            if dna[i:i+3] == 'TAA': return False
            if dna[i:i+3] == 'TAG': return False
            if dna[i:i+3] == 'TGA': return False

    # ends with a stop codon
    if dna.endswith('TGA'): return True
    if dna.endswith('TAG'): return True
    if dna.endswith('TGA'): return True

    return False
dna = sys.argv[1]
stdio.writeln(isPotientialGene(dna))
