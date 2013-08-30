require "spec_helper"

describe ApplicationHelper do
  describe "#kramdown" do
    it "turns markdown into safe HTML" do
      
      markdown = <<-EOF
This is some markdown. This is in a paragraph.
      
* this is
* a list
      EOF
      
      html = <<-EOF
<p>This is some markdown. This is in a paragraph.</p>

<ul>
  <li>this is</li>
  <li>a list</li>
</ul>
      EOF
      
      output = helper.kramdown(markdown)
      output.should == html
      output.should be_html_safe
    end
  end
end