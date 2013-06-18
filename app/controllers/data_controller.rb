class DataController < ApplicationController
  
  def save
    Follower.where(:userid=>params[:userid]).delete_all
    JSON.parse(params[:currentids]).each do |followerid|
      Follower.create(:time => Time.now) do |f|
      	f.userid=params[:userid]
      	f.username=params[:username]
		f.followerid=followerid
		f.followername=Twitter.user(followerid.to_i).name
      end
    end
    redirect_to :back
  end

end