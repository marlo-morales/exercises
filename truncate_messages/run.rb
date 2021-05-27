INPUT = [
  ["There was coal in his stocking and he was thrilled", 15],
  ["Today is the day I'll finally know what brick tastes like", 30],
  ["You're good at English when you know the difference between a man eating chicken and a man-eating chicken", 100],
  ["He wasn't bitter that she had moved on but from the radish", 500],
  ["He invested some skill points in Charisma and Strength", 250],
  ["He quietly entered the museum as the super bowl started. You're good at English when you know the difference between a man eating chicken and a man-eating chicken", 150],
  ["She was the type of girl who wanted to live in a pink house", 1],
  ["The bird had a belief that it was really a groundhog", 2],
  ["They improved dramatically once the lead singer left", 0],
  ["The newly planted trees were held up by wooden frames in hopes they could survive the next storm", 50]
]

def output(message, limit)
  limit = limit.to_i
  message.strip!
  words = message.split(' ')
  message[0, limit].split(' ').select do |word|
    words.include?(word)
  end.join(' ')
end

INPUT.each do |input|
  puts "INPUT: #{input}; OUTPUT: #{output(*input)}"
end
