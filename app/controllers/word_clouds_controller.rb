class WordCloudsController < ApplicationController
  def new
#    unless params[:handle].nil?
    if request.GET.include?("handle")
#      if params[:handle].start_with?("@") && params[:handle].include?(" ") == false
 #     if params[:handle].start_with? "@" #|| params[:handle].include " " == false
        topics = [params[:handle]]
        @search = $client.search(topics.join(","), :result_type=>'mixed').take(20).collect
        @twarray = Array.new
        @search.each do |tweet|
          temp_array = tweet.text.split(" ")
          temp_array.each do |word|
            word.delete! ":!?.(),&;"
            word.downcase!
            unless word.include? 'http'
              unless word.end_with?("'" || '"')
                unless word.start_with?("'" || '"')
                  unless word.eql?('the') || word.eql?('and') || word.eql?('on') || word.eql?('in') || word.eql?('a') \
                    || word.eql?('from') || word.eql?('for') || word.eql?('to') || word.eql?('at') || word.eql?('as') \
                    || word.eql?('there') || word.eql?('then') || word.eql?('so') || word.eql?('rt') || word.eql?('that') \
                    || word.eql?('than') || word.eql?('with') || word.eql?('of') || word.eql?('amp')
                      @twarray.push(word)
                  end
                end
              end
            end
          end
        end
        @twash = Hash.new
        @twarray.each do |word|
          if @twash[word] == nil
            @twash[word] = 1
          else
            @twash[word] += 1
          end
        end
      # else
      #   flash[:error] = "Please enter a real Twitter handle"
      #   redirect_to new_word_cloud_path
#      end
    end
  end

  def index
  end

  def create
  end
  
  def show
  end


end
