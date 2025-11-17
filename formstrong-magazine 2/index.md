---
layout: home
title: "FormStrong Magazine"
---

# Welcome to FormStrong Magazine
*Curating the Most Pertinent Reposts of Our Times*

## Latest Issue

<div class="current-issue">
  <h3>Issue #{{ site.current_issue }} - {{ "now" | date: "%B %Y" }}</h3>
  <p>This month's collection of the most significant reposts and commentary from @buildft</p>
  <a href="/issues/issue-{{ site.current_issue }}" class="btn-primary">Read Current Issue</a>
</div>

## Featured Reposts

{% for repost in site.reposts limit:6 %}
<article class="repost-preview">
  <h4><a href="{{ repost.url }}">{{ repost.title }}</a></h4>
  <p class="meta">Originally by @{{ repost.original_author }} • Curated {{ repost.date | date: "%B %d, %Y" }}</p>
  <p>{{ repost.excerpt }}</p>
  <div class="tags">
    {% for tag in repost.tags %}
    <span class="tag">#{{ tag }}</span>
    {% endfor %}
  </div>
</article>
{% endfor %}

## About FormStrong

FormStrong Magazine transforms the chaos of social media into curated, meaningful collections. Each month, we compile the most pertinent reposts from @buildft, providing context and commentary that cuts through the noise.

### What We Curate:
- **Politics & Society**: Critical perspectives on current events
- **Technology**: Innovation and its impact on humanity  
- **Culture**: Art, trends, and social movements
- **Health & Wellness**: Evidence-based insights
- **Business**: Economic trends and startup culture
- **Environment**: Climate action and sustainability

---

*Ready for physical exhibitions • Print-friendly formats • Digital-first publishing*

<style>
.current-issue {
  background: #f8f9fa;
  padding: 2rem;
  margin: 2rem 0;
  border-left: 4px solid #007bff;
}

.repost-preview {
  border-bottom: 1px solid #eee;
  padding: 1.5rem 0;
  margin-bottom: 1.5rem;
}

.meta {
  color: #666;
  font-size: 0.9em;
  margin: 0.5rem 0;
}

.tags {
  margin-top: 1rem;
}

.tag {
  background: #e9ecef;
  padding: 0.25rem 0.5rem;
  border-radius: 3px;
  font-size: 0.8em;
  margin-right: 0.5rem;
}

.btn-primary {
  background: #007bff;
  color: white;
  padding: 0.75rem 1.5rem;
  text-decoration: none;
  border-radius: 4px;
  display: inline-block;
}
</style>
