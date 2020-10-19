require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
    #variables d'instance: accès que quand il y a déjà une instance de la classe.
  end

  def save
    CSV.open("db/gossip.csv", "a+") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  # def self.find(id)
  #   all_gossips = self.all
  #   all_gossips[id.to_i]
  # end
  def self.find(id)
    gossip_index = []
    CSV.read("db/gossip.csv").each do |line|
      gossip_index << Gossip.new(line[0], line[1])
    end
    return gossip_index[id.to_i]
  end

  def self.update(author_edit, content_edit, id)
    gossip_update = []
    CSV.read("db/gossip.csv").each do |line|
      gossip_update << Gossip.new(line[0], line[1])
    end
      gossip = gossip_update[id]
      gossip.author = author_edit
      gossip.content = content_edit
      gossip_update[id] = gossip
      CSV.open("db/gossip.csv", "w") do |csv|
        gossip_update.each do |gossip|
        csv << [gossip.author, gossip.content]
        end
      end
  end

end