module JqueryMigratePatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :javascript_heads, :new_javascript_heads
    end
  end

  module InstanceMethods
    def javascript_heads_with_new_javascript_heads
        tags = javascript_include_tag('jquery-1.11.1-ui-1.11.0-ujs-3.1.1')
        tags << "\n".html_safe + javascript_include_tag('jquery-migrate-1.2.1.min.js', :plugin => 'redmine_jquery_migrate')
        tags << "\n".html_safe + javascript_include_tag('application')
        unless User.current.pref.warn_on_leaving_unsaved == '0'
          tags << "\n".html_safe + javascript_tag("$(window).load(function(){ warnLeavingUnsaved('#{escape_javascript l(:text_warn_on_leaving_unsaved)}'); });")
        end
        tags
    end
  end
end
