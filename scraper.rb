require 'hunting_season'
require 'csv'

def get_votes_for(post, acc = [])
  if(acc.length > 0)
    votes = post.votes(order: 'asc', newer: acc.last['id'])
  else
    votes = post.votes(order: 'asc')
  end
  acc += votes
  print "\rCurrent progress for #{post['id']} is #{acc.length} / #{post['votes_count']}"
  return get_votes_for(post, acc) if(votes.size > 0)
  puts ""
  acc
end
############################################################
client = ProductHunt::Client.new('ENTER_YOUR_DEV_TOKEN_HERE')
posts = [Fill_This_With_IDs]
############################################################
CSV.open("all_voters.csv", "a") do |csv| 
  posts.each do |post_id|
    post = client.post(post_id)
    puts "Processing post #{post_id}: #{post['name']}"
    voters = get_votes_for(post).map { |v| v['user']['twitter_username']}.uniq.compact.sort
    voters.each do |voter|
      csv << [voter]
    end
  puts "Done\n\n"
  end
end