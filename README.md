# Dna Sequence

You’re working in the genetics industry and your chief scientist needs help. He explains that
genes are made of the following nucleotides: Adenine, Guanine, Thymine, Cytosine (A, G, T, C)
DNA is made up by arranging these 4 nucleotides in a variety of ways. In the latest experiment
they have created a super creature by combining two different strands of DNA which resulted in
one new long string. The resulting DNA sequence is a combination of two parent strands. What
he wants to know is which of the two parents contributed the longest sequence.

Parent 1: CABCABCABCCT
Parent 2: TTTCCCBBBCCC
Child:    CABCABCTTTCC

The answer given the sample above would be Parent 1 =&gt; CABCABC.

Devise an algorithm to help him find the primary contributor. You can expect to be given 3
strings. 2 Parents and 1 child. The payload would typically look like:

```
{
  'parent 1': 'ABCTABCTABCT',
  'parent 2': 'BBCBBTBBBBBB',
  'child': 'BBABBBABBBAB'
}
```

Your output should be:

```
{
  'primary donor': 'parent 2',
  'intact sequence': 'BBB'
}
```

* Ruby Version

    ruby 2.3.0

* How to execute

    `ruby dna_sequence.rb`
