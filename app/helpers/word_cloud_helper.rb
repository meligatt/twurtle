module WordCloudHelper
  def tag_cloud(hash)
   tags = @twash.sort_by{ |key, value| value }
    if tags.length > 0
      maxOccurs = tags.last[1]
      minOccurs = tags.first[1]

      # Get relative size for each of the tags and store it in a hash
      minFontSize = 5
      maxFontSize = 100
      @tag_cloud_hash = Hash.new(0)
      tags.shuffle!
      tags.each do |tag| 
         weight = (tag[1]-minOccurs).to_f/(maxOccurs-minOccurs)
         size = minFontSize + ((maxFontSize-minFontSize)*weight).round
         @tag_cloud_hash[tag[0]] = size #if size > 7
      end
    end
  end
end
