#!/usr/bin/env ruby

# FormStrong Magazine - Twitter Monitor
# Simple script to help track @buildft posts for curation

require 'net/http'
require 'json'
require 'date'

class TwitterMonitor
  def initialize
    @output_file = 'potential-reposts.md'
    puts "🐦 FormStrong Twitter Monitor"
    puts "=" * 40
  end
  
  def check_mentions
    puts "\n📱 Checking for mentions of @buildft..."
    
    # Since we can't access Twitter API without credentials,
    # this provides a manual workflow for tracking posts
    
    puts "\n🔍 Manual Monitoring Workflow:"
    puts "1. Visit: https://twitter.com/buildft"
    puts "2. Look for recent retweets/quotes with engagement"
    puts "3. Use this script to log potential reposts"
    puts "4. Run curation analysis on promising content"
    
    manual_entry_mode
  end
  
  private
  
  def manual_entry_mode
    puts "\n📝 Enter potential repost (press Enter twice when done):"
    
    posts = []
    loop do
      print "\nTweet URL: "
      url = gets.chomp
      break if url.empty?
      
      print "Original author (@username): "
      author = gets.chomp
      
      print "Brief description: "
      description = gets.chomp
      
      print "Engagement estimate (likes/retweets): "
      engagement = gets.chomp
      
      posts << {
        url: url,
        author: author,
        description: description,
        engagement: engagement,
        date: Date.today
      }
      
      puts "✅ Added to monitoring list"
    end
    
    save_monitoring_data(posts) unless posts.empty?
  end
  
  def save_monitoring_data(posts)
    content = generate_monitoring_report(posts)
    
    File.open(@output_file, 'a') do |file|
      file.write(content)
    end
    
    puts "\n📄 Saved to #{@output_file}"
    puts "🎯 Next steps:"
    puts "   1. Review engagement and relevance"
    puts "   2. Select top posts for curation"
    puts "   3. Run: ruby add-repost.rb"
  end
  
  def generate_monitoring_report(posts)
    report = <<~HEADER
      
      ## Twitter Monitoring Report - #{Date.today}
      
      Found #{posts.length} potential reposts for FormStrong curation:
      
    HEADER
    
    posts.each_with_index do |post, index|
      report += <<~POST
        ### #{index + 1}. #{post[:description]}
        - **Author**: @#{post[:author]}
        - **URL**: #{post[:url]}
        - **Engagement**: #{post[:engagement]}
        - **Potential Categories**: [Add after review]
        - **Curation Priority**: [High/Medium/Low]
        
        **Why consider this?**
        [Add analysis after reviewing original post]
        
        ---
        
      POST
    end
    
    report
  end
end

# Simplified Twitter tracking without API
class SimpleTwitterTracker
  def self.track_buildft
    puts "📋 @buildft Tracking Checklist"
    puts "=" * 30
    
    checklist = [
      "Visit https://twitter.com/buildft",
      "Sort by: Latest tweets",
      "Look for posts with 50+ likes or 10+ retweets",
      "Check replies for quality discussion",
      "Note posts that challenge mainstream narratives",
      "Save interesting quote tweets with commentary",
      "Check for cross-platform sharing (LinkedIn, etc.)"
    ]
    
    checklist.each_with_index do |item, index|
      puts "#{index + 1}. #{item}"
    end
    
    puts "\n🎯 Curation Criteria:"
    puts "- Educational value over entertainment"
    puts "- Challenges assumptions or provides new perspective"
    puts "- Relevant to FormStrong themes (health, tech, culture, politics)"
    puts "- High-quality original content, not just aggregation"
    puts "- Likely to remain relevant in 6+ months"
  end
end

# Command line interface
if __FILE__ == $0
  puts "FormStrong Twitter Monitor"
  puts "1. Manual monitoring workflow"
  puts "2. Show tracking checklist"
  print "Choose option (1-2): "
  
  choice = gets.chomp.to_i
  
  case choice
  when 1
    monitor = TwitterMonitor.new
    monitor.check_mentions
  when 2
    SimpleTwitterTracker.track_buildft
  else
    puts "Invalid option. Use 1 or 2."
  end
end
