---
layout: default
title: "All Issues - FormStrong Magazine"
---

# FormStrong Magazine Issues

*A curated archive of our monthly magazines*

## Current Issue

{% assign latest_issue = site.issues | sort: 'date' | reverse | first %}
{% if latest_issue %}
<div class="current-issue-featured">
  <div class="issue-card">
    <div class="issue-card-header">
      <h2>{{ latest_issue.title }}</h2>
      <p class="issue-theme">{{ latest_issue.theme }}</p>
    </div>
    <div class="issue-card-body">
      <p>{{ latest_issue.excerpt | default: latest_issue.tagline }}</p>
      <a href="{{ latest_issue.url }}" class="cta-button">Read Latest Issue</a>
      <a href="{{ latest_issue.url }}" onclick="window.print(); return false;" class="cta-secondary">Print PDF</a>
    </div>
  </div>
</div>
{% endif %}

## All Issues

<div class="issue-grid">
{% assign sorted_issues = site.issues | sort: 'date' | reverse %}
{% for issue in sorted_issues %}
  <article class="issue-card">
    <div class="issue-card-header">
      <h3><a href="{{ issue.url }}">{{ issue.title }}</a></h3>
      <p class="issue-date">{{ issue.date | date: "%B %Y" }}</p>
      <p class="issue-theme">{{ issue.theme }}</p>
    </div>
    
    <div class="issue-card-body">
      <p>{{ issue.excerpt | default: issue.tagline | truncate: 120 }}</p>
      
      <div class="issue-stats">
        {% assign issue_reposts = site.reposts | where: "issue", issue.issue_number %}
        <span class="stat">{{ issue_reposts.size }} reposts</span>
        <span class="stat">{{ issue.total_engagement | default: "N/A" }} engagement</span>
      </div>
      
      <div class="issue-actions">
        <a href="{{ issue.url }}" class="cta-button">Read Issue</a>
        <a href="{{ issue.url }}" onclick="window.print(); return false;" class="cta-secondary">Print</a>
      </div>
    </div>
    
    <div class="issue-preview">
      <h4>Featured Topics:</h4>
      <div class="topic-tags">
        {% for section in issue.sections limit:3 %}
        <span class="tag">{{ section.title }}</span>
        {% endfor %}
      </div>
    </div>
  </article>
{% endfor %}
</div>

{% if site.issues.size == 0 %}
<div class="no-issues">
  <h3>Coming Soon!</h3>
  <p>We're preparing our first issue. Check back soon for curated content that cuts through the noise.</p>
  <p>Follow <a href="https://twitter.com/buildft" target="_blank">@buildft</a> for daily curation highlights.</p>
</div>
{% endif %}

## Issue Archive by Category

<div class="category-archive">
  <h3>Browse by Topic</h3>
  
  <div class="category-grid">
    <div class="category-card">
      <h4>Politics & Society</h4>
      <p>Critical perspectives on current events and social movements</p>
      {% assign politics_reposts = site.reposts | where: "category", "politics" %}
      <span class="category-count">{{ politics_reposts.size }} posts</span>
    </div>
    
    <div class="category-card">
      <h4>Technology</h4>
      <p>Innovation's impact on human consciousness and society</p>
      {% assign tech_reposts = site.reposts | where: "category", "technology" %}
      <span class="category-count">{{ tech_reposts.size }} posts</span>
    </div>
    
    <div class="category-card">
      <h4>Culture</h4>
      <p>Art, trends, and cultural shifts worth understanding</p>
      {% assign culture_reposts = site.reposts | where: "category", "culture" %}
      <span class="category-count">{{ culture_reposts.size }} posts</span>
    </div>
    
    <div class="category-card">
      <h4>Health & Wellness</h4>
      <p>Evidence-based insights on human optimization</p>
      {% assign health_reposts = site.reposts | where: "category", "health" %}
      <span class="category-count">{{ health_reposts.size }} posts</span>
    </div>
  </div>
</div>

## Newsletter Subscription

<div class="newsletter-signup">
  <h3>Never Miss an Issue</h3>
  <p>Get notified when new monthly issues are published</p>
  <a href="mailto:hello@formstrong.com?subject=Magazine Subscription&body=Please notify me when new FormStrong Magazine issues are published." class="cta-button">Subscribe by Email</a>
</div>

<style>
.current-issue-featured {
  margin: 2rem 0 4rem 0;
}

.current-issue-featured .issue-card {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  text-align: center;
  padding: 3rem 2rem;
}

.current-issue-featured .issue-card-header h2 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
  color: white;
}

.issue-theme {
  font-style: italic;
  font-size: 1.2rem;
  opacity: 0.9;
  margin-bottom: 1rem;
}

.issue-date {
  color: #666;
  font-size: 0.9rem;
  margin-bottom: 0.5rem;
}

.issue-stats {
  display: flex;
  gap: 1rem;
  margin: 1rem 0;
  font-size: 0.9rem;
  color: #666;
}

.issue-actions {
  display: flex;
  gap: 1rem;
  margin-top: 1.5rem;
}

.issue-actions .cta-secondary {
  background: transparent;
  border: 1px solid #ccc;
  color: #666;
}

.issue-preview {
  margin-top: 1.5rem;
  padding-top: 1rem;
  border-top: 1px solid #eee;
}

.issue-preview h4 {
  margin: 0 0 0.5rem 0;
  font-size: 0.9rem;
  color: #666;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.topic-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.category-archive {
  margin: 4rem 0;
  padding: 2rem;
  background: #f8f9fa;
  border-radius: 8px;
}

.category-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin-top: 1.5rem;
}

.category-card {
  background: white;
  padding: 1.5rem;
  border-radius: 8px;
  border-left: 4px solid #007bff;
}

.category-card h4 {
  margin-top: 0;
  color: #007bff;
}

.category-count {
  display: inline-block;
  background: #e9ecef;
  padding: 0.25rem 0.75rem;
  border-radius: 15px;
  font-size: 0.8rem;
  margin-top: 1rem;
}

.newsletter-signup {
  text-align: center;
  padding: 3rem 2rem;
  background: #343a40;
  color: white;
  border-radius: 8px;
  margin: 4rem 0;
}

.newsletter-signup h3 {
  color: white;
  margin-bottom: 1rem;
}

.no-issues {
  text-align: center;
  padding: 4rem 2rem;
  color: #666;
}

@media (max-width: 768px) {
  .issue-actions {
    flex-direction: column;
  }
  
  .current-issue-featured .issue-card-header h2 {
    font-size: 2rem;
  }
  
  .category-grid {
    grid-template-columns: 1fr;
  }
}
</style>
