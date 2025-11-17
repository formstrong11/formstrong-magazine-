#!/usr/bin/env ruby

require 'date'
require 'fileutils'

# FormStrong Magazine - Add New Repost Script
# Usage: ruby add-repost.rb

class FormStrongRepost
  def initialize
    @date = Date.today
    @posts_dir = '_reposts'
    
    puts "🎯 FormStrong Magazine - Add New Repost"
    puts "=" * 50
  end
  
  def create_repost
    # Collect basic information
    puts "\n📝 Enter repost details:"
    
    print "Title: "
    title = gets.chomp
    
    print "Original author (Twitter handle without @): "
    original_author = gets.chomp
    
    print "Original tweet URL: "
    original_url = gets.chomp
    
    print "Issue number (1, 2, 3...): "
    issue = gets.chomp.to_i
    
    puts "\nCategories: politics, technology, culture, health, business, environment"
    print "Category: "
    category = gets.chomp.downcase
    
    print "Tags (comma-separated): "
    tags = gets.chomp.split(',').map(&:strip)
    
    puts "\n📱 Original Post Content:"
    puts "(Enter the original tweet text, then press Enter twice when done)"
    original_content = []
    loop do
      line = gets.chomp
      break if line.empty? && !original_content.empty?
      original_content << line unless line.empty?
    end
    
    puts "\n💭 FormStrong Commentary:"
    puts "(Why is this post significant? What makes it worth curating?)"
    commentary = []
    loop do
      line = gets.chomp
      break if line.empty? && !commentary.empty?
      commentary << line unless line.empty?
    end
    
    # Generate filename
    filename = generate_filename(title)
    filepath = File.join(@posts_dir, "#{filename}.md")
    
    # Create the post file
    create_post_file(filepath, {
      title: title,
      original_author: original_author,
      original_url: original_url,
      issue: issue,
      category: category,
      tags: tags,
      original_content: original_content.join(' '),
      commentary: commentary.join(' ')
    })
    
    puts "\n✅ Repost created successfully!"
    puts "📁 File: #{filepath}"
    puts "🌐 Preview: bundle exec jekyll serve"
    puts "🚀 Publish: git add . && git commit -m 'Add repost: #{title}' && git push"
  end
  
  private
  
  def generate_filename(title)
    # Convert title to URL-friendly filename
    title.downcase
         .gsub(/[^a-z0-9\s-]/, '')
         .gsub(/\s+/, '-')
         .gsub(/-+/, '-')
         .strip
  end
  
  def create_post_file(filepath, data)
    content = <<~FRONTMATTER
      ---
      layout: repost
      title: "#{data[:title]}"
      date: #{@date}
      issue: #{data[:issue]}
      category: #{data[:category]}
      tags: [#{data[:tags].map { |tag| "\"#{tag}\"" }.join(', ')}]

      # Original post metadata
      original_author: "#{data[:original_author]}"
      original_date: #{@date}
      original_url: "#{data[:original_url]}"
      author_avatar: "/assets/images/avatars/#{data[:original_author]}.jpg"

      # Post content
      original_content: "#{data[:original_content]}"

      # FormStrong analysis
      formstrong_commentary: "#{data[:commentary]}"

      context: |
        [Add context about why this post matters, historical background, or related events]

      implications: |
        **For [Category]**: [Specific implications for this area]
        
        **For Society**: [Broader social implications]
        
        **For Individuals**: [Personal/practical applications]

      related_topics:
        - "[Related topic 1]"
        - "[Related topic 2]"
        - "[Related topic 3]"

      engagement:
        likes: 0
        retweets: 0
        replies: 0
      ---

      [Add extended commentary, analysis, and additional insights here]

      ## Why This Matters

      [Explain the significance of this repost in the current context]

      ## Broader Patterns

      [Connect this post to larger trends or themes]

      ## Practical Applications

      [What can readers do with this information?]

      ## Questions for Further Consideration

      [Open questions or areas for deeper exploration]
    FRONTMATTER
    
    File.write(filepath, content)
  end
end

# Run the script
if __FILE__ == $0
  repost_creator = FormStrongRepost.new
  repost_creator.create_repost
end
