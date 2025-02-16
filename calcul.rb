class WordProblem
    VALID_OPERATIONS = {
      "plus" => :+,
      "minus" => :-,
      "multiplied by" => :*,
      "divided by" => :/
    }
  
    def initialize(question)
      @question = question.downcase.gsub("?", "").strip
    end
  
    def answer
      raise ArgumentError, "Invalid question format" unless valid_question?
  
      elements = parse_question
      compute_result(elements)
    end
  
    private
  
    def valid_question?
      @question.start_with?("what is ")
    end
  
    def parse_question
      expression = @question.sub("what is ", "")
  
      # On remplace les expressions complexes pour éviter les erreurs de découpage
      VALID_OPERATIONS.keys.each do |op|
        expression.gsub!(op, VALID_OPERATIONS[op].to_s)
      end
  
      tokens = expression.split
      elements = []
  
      tokens.each do |token|
        if token.match?(/^-?\d+$/)  # Vérifie si c'est un nombre
          elements << token.to_i
        elsif VALID_OPERATIONS.values.include?(token.to_sym)  # Vérifie si c'est une opération
          elements << token.to_sym
        else
          raise ArgumentError, "Unsupported operation"
        end
      end
  
      elements
    end
  
    def compute_result(elements)
      raise ArgumentError, "Invalid syntax" unless elements.first.is_a?(Integer)
  
      result = elements.shift
  
      until elements.empty?
        operator = elements.shift
        operand = elements.shift
        raise ArgumentError, "Invalid syntax" unless operand.is_a?(Integer)
  
        result = result.send(operator, operand)
      end
  
      result
    end
  end
  
  # Exemples d'utilisation
  problems = [
    "What is 5?",
    "What is 5 plus 13?",
    "What is 7 minus 5?",
    "What is 6 multiplied by 4?",
    "What is 25 divided by 5?",
    "What is 5 plus 13 plus 6?",
    "What is 3 plus 2 multiplied by 3?",
    "What is 52 cubed?",
    "Who is the President of the United States?",
    "What is 1 plus plus 2?"
  ]
  
  problems.each do |problem|
    begin
      puts "#{problem} => #{WordProblem.new(problem).answer}"
    rescue ArgumentError => e
      puts "#{problem} => Error: #{e.message}"
    end
  end
  