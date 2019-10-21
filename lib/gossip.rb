class Gossip
  
  attr_accessor :author, :content, :id #habilité à lire et écrire

  def initialize(author,content)
    @author = author
    @content = content
    
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []# va chercher chacune des lignes du csv do
    CSV.read("./db/gossip.csv").each do |csv_line| # crée un gossip avec les infos de la ligne
      @all_gossips << Gossip.new(csv_line[0], csv_line[1])# all_gossips << gossip qui vient d'être créé
    end
    return @all_gossips
  end

  def self.find(x)
    return self.all[x.to_i-1]
  end
  
  def self.update(modified_author, modified_content, id)
		modified_gossips = Gossip.all
		CSV.open("./db/gossip.csv", 'w') 
		modified_gossips[id.to_i-1].author = modified_author
		modified_gossips[id.to_i-1].content = modified_content
		modified_gossips.each {|gossip| gossip.save}
	end


end