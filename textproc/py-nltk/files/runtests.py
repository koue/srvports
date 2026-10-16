import sys
sys.path.append(sys.argv[1])

import nltk


GRAMMAR = [
# Produced 130 liters of water
r"""
    NP: {<NN.*|VB.*>+<IN|VBZ>?<CD>+<NN.*>+<IN|VBZ>?<NN.*>*}
""",
# guidance of 130 to 135 liters
r"""
    NP: {<NN.*>+<IN|VBZ>?<CD>+<TO>?<CD>+<NN.*>}
""",
r"""
    NP: {<CD>+<IN|VBZ>?<NN.*>+}
""",
]


def tree_to_chunks(tree):
    """Extract (chunk_type, text) pairs from an NLTK parse tree."""
    chunks = []
    for subtree in tree:
        if hasattr(subtree, "label"):
            chunk_type = subtree.label()
            words = " ".join(word for word, _ in subtree.leaves())
            chunks.append((chunk_type, words))
    return chunks


def main():
    text = 'It was produced 130 liters of water and other stuff'

    for sent in nltk.sent_tokenize(text):
        output = []
        print(sent)
        print('-'*10)
        sent_tokens = nltk.word_tokenize(sent)
        tagging = nltk.pos_tag(sent_tokens)
        print(tagging)
        print('-'*10)
        for g in GRAMMAR:
            chunking = nltk.RegexpParser(g)
            tree = chunking.parse(tagging)
            print(tree)
            print('-'*10)
            for x in tree_to_chunks(tree):
                output.append(x[1])
        sorted_output = sorted(output, key=len, reverse=True)
        result = []
        for s in sorted_output:
            found = 0
            for r in result:
                if s in r:
                    found = 1
                    break
            if found == 0:
                result.append(s)
        for r in result:
            print(r)
        print('='*10)


if __name__ == "__main__":
    sys.exit(main())
