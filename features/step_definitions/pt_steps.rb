# -*- encoding : utf-8 -*-

module Capextensions

  DATE_TIME_SUFFIXES = {
          :year => '1i',
          :month => '2i',
          :day => '3i',
          :hour => '4i',
          :minute => '5i'
  }

  def select_date(date_to_select, options={})
    date = date_to_select.is_a?(Date) || date_to_select.is_a?(Time) ?
            date_to_select : Date.parse(date_to_select)

    if options[:id_prefix].blank?
      if options[:from].blank?
        source = locate(:xpath, Capybara::XPath.append("//select[contains(@id, '_#{DATE_TIME_SUFFIXES[:year]}')]"))
        id_prefix = source.node.attributes["id"].value[/(.*?)_#{DATE_TIME_SUFFIXES[:year]}$/, 1]
      else
        msg = "cannot select option, no select box with id, name, or label '#{options[:from]}' found"
        begin
          label = locate(:xpath, Capybara::XPath.append("//label[text()='#{options[:from]}']"), msg)
          id_prefix = label.node.attributes["for"].value
      rescue Capybara::ElementNotFound
          begin
            previous_exception = $!
            label = locate(:xpath, Capybara::XPath.append("//label[text()='#{options[:from].capitalize}']"), msg)
            id_prefix = label.node.attributes["for"].value
          rescue
            raise "#{previous_exception}\nand\n#{$!}"
          end
        end
      end
    end

    id_prefix ||= options[:id_prefix]

    select date.year.to_s, :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:year]}"
    select date.strftime('%B'), :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:month]}"
    select date.day.to_s, :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:day]}"
  end

  def select_time(time_to_select, options ={})
    time = time_to_select.is_a?(Time) ? time_to_select : Time.parse(time_to_select)

    if options[:id_prefix].blank?
      if options[:from].blank?
        source = locate(:xpath, Capybara::XPath.append("//select[contains(@id, '_#{DATE_TIME_SUFFIXES[:hour]}')]"))
        id_prefix = source.node.attributes["id"].value[/(.*?)_#{DATE_TIME_SUFFIXES[:hour]}$/, 1]
      else
        msg = "cannot select option, no select box with id, name, or label '#{options[:from]}' found"
        begin
          label = locate(:xpath, Capybara::XPath.append("//label[text()='#{options[:from]}']"), msg)
          id_prefix = label.node.attributes["for"].value
        rescue Capybara::ElementNotFound
          begin
            previous_exception = $!
            label = locate(:xpath, Capybara::XPath.append("//label[text()='#{options[:from].capitalize}']"), msg)
            id_prefix = label.node.attributes["for"].value
          rescue
            raise "#{previous_exception}\nand\n#{$!}"
          end
        end
      end
    end

    id_prefix ||= options[:id_prefix]

    select time.hour.to_s.rjust(2, '0'), :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:hour]}"
    select time.min.to_s.rjust(2, '0'), :from => "#{id_prefix}_#{DATE_TIME_SUFFIXES[:minute]}"
  end

  def select_datetime(time_to_select, options={})
    time = time_to_select.is_a?(Time) ? time_to_select : Time.parse(time_to_select)

    if options[:from]
      msg = "cannot select option, no select box with id, name, or label '#{options[:from]}' found"
      begin
        label = locate(:xpath, Capybara::XPath.append("//label[text()='#{options[:from]}']"), msg)
        id_prefix = label.node.attributes["for"].value
      rescue Capybara::ElementNotFound
        begin
          previous_exception = $!
          label = locate(:xpath, Capybara::XPath.append("//label[text()='#{options[:from].capitalize}']"), msg)
          id_prefix = label.node.attributes["for"].value
        rescue
          raise "#{previous_exception}\nand\n#{$!}"
        end
      end
    end

    options[:id_prefix] ||= (options[:from] ? id_prefix : nil)

    select_date time, options
    select_time time, options
  end

  # Maybe this methos should be defined in the other order, capybara is the default?

  def have_selector(path, options = {})
    # content key to text key
    content = options.delete(:content)
    options[:text] = content unless content.nil?
    have_css(path, options)
  end
end

World(Capextensions)

Dado /^que eu estou n[a|o] (.+)$/ do |pagina|
  visit path_to(pagina)
end

Dado /^que se passaram (\d+) dias$/ do |quantidade_de_dias|
  Timecop.freeze(Date.today + quantidade_de_dias.to_i)
end

Quando /^eu seleciono "([^\"]*)" no campo hora "([^\"]*)"$/ do |time, time_label|
  select_time(time, :from => time_label)
end

Quando /^eu preencho "([^\"]*)" com "([^\"]*)"$/ do |campo, valor|
  fill_in(campo, :with => valor)
end

Quando /^eu não preencho "([^"]*)"$/ do |arg1|
end

Quando /^eu vou para(?: a| o) (.+)$/ do |page_name|
  visit path_to(page_name)
end

Quando /^eu seleciono "([^\"]*)" em "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

Quando /^eu pressiono "([^\"]*)"$/ do |botao|
  click_button(botao)
end

Quando /^eu clico em "([^\"]*)"$/ do |link|
  click_link(link)
end

Quando /^eu clico em "([^\"]*)" e pressiono "([^\"]*)" no popup$/ do |link, botao|
  page.evaluate_script("window.confirm = function() { return true; }") if botao == 'OK'
  page.evaluate_script("window.confirm = function() { return false; }") if botao == 'Cancelar'
  click_link(link)
end

Quando /^eu adiciono o arquivo "([^\"]*)" em "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Quando /^eu seleciono nada/ do
end

Quando /^eu visito a URL "([^"]*)"$/ do |url|
  visit url
end

Quando /^eu marco "([^"]*)"$/ do |field|
  check(field)
end

Quando /^(?:|eu )escolho "([^"]*)"(?: em "([^"]*)")?$/ do |field, selector|
  with_scope(selector) do
    choose(field)
  end
end

Quando /^eu desmarco "([^"]*)"$/ do |field|
  uncheck(field)
end

Quando /^eu espero (\d+) segundos?$/ do |secs|
  sleep secs.to_i
end

Então /^(?:|eu )devo ver "([^"]*)"(?: em "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

Então /^(?:|eu )não devo ver "([^"]*)"(?: em "([^"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end

Então /^(?:|eu )devo ver [a|o] (id|class) "([^"]*)" na tag "([^"]*)"$/ do |atributo, valor, tag|
  page.should have_xpath("//#{tag}[@#{atributo}=\"#{valor}\"]")
end

Então /^(?:|eu )não devo ver [a|o] (id|class) "([^"]*)" na tag "([^"]*)"$/ do |atributo, valor, tag|
  page.should_not have_xpath("//#{tag}[@#{atributo}=\"#{valor}\"]")
end

Então /^eu devo estar (na|no) (.+)$/ do |opcao, page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

#Então /^eu devo ver a tabela "(.+)" com$/ do |tabela_id, tabela_esperada|
#  tabela_esperada.diff!(tableish("tbody#" + tabela_id + " tr", "td, th"))
#end

Então /^eu devo ver a tabela "(.+)" com$/ do |table_id, expected_table|
  html_table = table_at(table_id).to_a
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '') } }
  expected_table.diff!(html_table)
end

Então /^eu devo ver a tabela com:$/ do |expected_projects_table|
  expected_projects_table.diff!(tableish('table tr', 'td,th'))
end

Então /^o campo "([^"]*)" deve conter "([^"]*)"$/ do |field, value|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  if field_value.respond_to? :should
    field_value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_value)
  end
end

Então /^eu devo ter o status "([^"]*)" na resposta$/ do |http_status|
  page.status_code.should == http_status.to_i
end

Então /^eu devo ter o layout "([^"]*)" renderizado$/ do |nome|
  response.should render_template(nome)
end

