tests = [
  {
    'parent 1' => 'CABCABCABCCT',
    'parent 2' => 'TTTCCCBBBCCC',
    'child'    => 'CABCABCTTTCC'
  },
  {
    'parent 1' => 'ABCTABCTABCT',
    'parent 2' => 'BBCBBTBBBBBB',
    'child'    => 'BBABBBABBBAB'
  }
]


def get_sequences(child, patient)
  rest = []
  child.split('').each_with_index do |c, i|
    result = []
    patient.split('').each_with_index do |p, j|
      if c == p
        sequence = ''
        child_index = i
        patient_index = j
        while child[child_index] && patient[patient_index] && child[child_index] == patient[patient_index]
          sequence << patient[patient_index]
          child_index += 1
          patient_index += 1
        end
      end
      result << sequence if sequence && sequence.length > 1
    end
    rest << result.compact.max_by { |e| e.length }
  end
  rest.compact.uniq.max_by { |e| e.length }
end

def get_primary_donor(obj1, obj2)
  if obj1[:sequence].length > obj2[:sequence].length
    return {
      'Primary donor'   => obj1[:parent],
      'Intact sequence' => obj1[:sequence]
    }
  else
    return {
      'Primary donor'   => obj2[:parent],
      'Intact sequence' => obj2[:sequence]
    }
  end
end

tests.each_with_index do |test, i|
  print "test #{i + 1}: "
  puts get_primary_donor(
    {
      sequence: get_sequences(test['child'], test['parent 1']),
      parent: 'Parent 1'
    },
    {
      sequence: get_sequences(test['child'], test['parent 2']),
      parent: 'Parent 2'
    }
  )
end
