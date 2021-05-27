INPUT = [
  [2, '1A 2F 1C'],
  [1, ''],
  [2, ''],
  [2, '2A 1F 2C']
]

PRIMARY_FAMILY_COLUMN = ['D', 'E', 'F', 'G']
SECONDARY_FAMILIES_COLUMNS = [['B', 'C', 'D', 'E'], ['F', 'G', 'H', 'J']]
FAMILIES_COLUMNS = [PRIMARY_FAMILY_COLUMN] + SECONDARY_FAMILIES_COLUMNS

def output(n, s)
  reserved_seats = s.upcase.split(' ').uniq
  vacant_family_seats = (1..n.to_i).each_with_object([]) do |row, vfs|
    reserved_columns = reserved_seats.select { |r_seat| r_seat.start_with?(row.to_s) }.map { |r_seat| r_seat[1] }.sort
    (reserved_columns.empty? ? SECONDARY_FAMILIES_COLUMNS : FAMILIES_COLUMNS).each do |family_column|
      next if (family_column & reserved_columns).any?

      
      vfs << family_column.map { |f_col| "#{row}#{f_col}" }
      break if PRIMARY_FAMILY_COLUMN == family_column
    end
  end
  # puts "vacant_family_seats: #{vacant_family_seats}"
  vacant_family_seats.length
end

INPUT.each do |input|
  puts "INPUT: #{input}; OUTPUT: #{output(*input)}"
end
