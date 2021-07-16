class Person
    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    def initialize(name)
        @name = name
        self.bank_account = 25
        self.happiness = 8
        self.hygiene = 8
    end

    def happiness=(happiness)
        @happiness = min_max(happiness, 0, 10)
    end

    def hygiene=(hygiene)
        @hygiene = min_max(hygiene, 0, 10)
    end

    def clean?
        self.hygiene > 7
    end

    def happy?
        self.happiness > 7
    end

    def get_paid(amount)
        self.bank_account += amount
        "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness += 2
        self.hygiene -= 3
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(person, topic)
        value, result = Person.conversation_values(topic)
        self.happiness += value
        person.happiness += value
        result
    end

    def self.conversation_values(topic)
        case topic
        when "politics"
            [-2, "blah blah partisan blah lobbyist"]
        when "weather"
            [1, "blah blah sun blah rain"]
        else
            [0, "blah blah blah blah blah"]
        end
    end
end

def max(a, b)
    a > b ? a : b
end

def min(a, b)
    a < b ? a : b
end

def min_max(value, minimum, maximum)
    min(maximum, max(minimum, value))
end