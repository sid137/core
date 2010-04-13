;;; rails-snippets.el --- snippets for rails related modes

;; Copyright (C) 2006 Galinsky Dmitry <dima dot exe at gmail dot com>

;; Authors: Galinsky Dmitry <dima dot exe at gmail dot com>,

;; Keywords: ruby rails languages oop
;; $URL: svn+ssh://crazypit@rubyforge.org/var/svn/emacs-rails/trunk/rails-core.el $
;; $Id: rails-navigation.el 23 2006-03-27 21:35:16Z crazypit $

;;; License

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

(unless (boundp 'ruby-mode-abbrev-table)
  (defvar ruby-mode-abbrev-table)
  (define-abbrev-table 'ruby-mode-abbrev-table ()))
(unless (boundp 'html-mode-abbrev-table)
  (defvar html-mode-abbrev-table)
  (define-abbrev-table 'html-mode-abbrev-table ()))
(unless (boundp 'html-helper-mode-abbrev-table)
  (defvar html-helper-mode-abbrev-table)
  (define-abbrev-table 'html-helper-mode-abbrev-table ()))
(unless (boundp 'nxml-mode-abbrev-table)
  (defvar nxml-mode-abbrev-table)
  (define-abbrev-table 'nxml-mode-abbrev-table ()))

(defvar rails-snippets-menu-list
  (list '(:m "ruby"
             (:m "loops" ruby-mode-abbrev-table
                 ("w" "attr_writer :$${attr_names}" "attr_writer ...")
                 ) ; loops
             (:m "general" ruby-mode-abbrev-table
                 ("yl" "File.open($${yaml}) { |$${file}| YAML.load($${file}) }" "YAML.load(file)")
                 ("yd" "File.open($${yaml}, \"w\") { |$${file}| YAML.dump($${obj}, $${file}) }" "YAML.dump(..., file)")
                 ("y" " :yields: $${arguments}" ":yields:")
                 ("verren" "verify :only => [:$${1}], :method => :post, :render => {:status => 500, :text => \"use HTTP-POST\"}\n" "verify -- render")
                 ("verred" "verify :only => [:$${1}], :session => :user, :params => :id, :redirect_to => {:action => '$${index}'}\n" "verify -- redirect")
                 ("tra" "transaction$${1} { $. }" "transaction( ... ) { ... }")
                 ("sub" "sub(/$${pattern}/) { |$${match}|$. }" "sub(/.../) { |match| ... }")
                 ("sca" "scan(/$${pattern}/) { |$${match}| $. }" "scan(/.../) { |match| ... }")
                 ("rep" "results.report(\"$${name}:\") { TESTS.times { $. } }" "results.report(...) { ... }")
                 ("rdb" "RAILS_DEFAULT_LOGGER.debug \"$${message}\"$." "RAILS_DEFAULT_LOGGER.debug")
                 ("rb" "#!/usr/bin/env ruby -w\n\n" "#!/usr/local/bin/ruby -w")
                 ("r" "attr_reader :$${attr_names}" "attr_reader ...")
                 ("pn" "PStore.new($${file_name})" "PStore.new( ... )")
                 ("patfh" "File.join(File.dirname(__FILE__), *%w[$${here}])" "path_from_here( ... )")
                 ("ope" "open($${pipe}) { |$${io}| $. }" "open(\"path/or/url\", \"w\") { |io| ... }")
                 ("ml" "File.open($${dump}) { |$${file}| Marshal.load($${file}) }" "Marshal.load(obj)")
                 ("min" "min { |a, b| $. }" "min { |a, b| ... }")
                 ("max" "max { |a, b| $. }" "max { |a, b| ... }")
                 ("md" "File.open($${dump}, \"w\") { |$${file}| Marshal.dump($${obj}, $${file}) }" "Marshal.dump(..., file)")
                 ("lam" "lambda { |$${args}|$. }" "lambda { |args| ... }")
                 ("gsu" "gsub(/$${pattern}/) { |$${match}|$. }" "gsub(/.../) { |match| ... }")
                 ("gre" "grep($${pattern}) { |$${match}| $. }" "grep(/pattern/) { |match| ... }")
                 ("bm" "TESTS = $${10_000}\nBenchmark.bmbm($${10}) do |results|\n  $.\n$>end" "Benchmark.bmbm(...) do ... end")
                 ("am" "alias_method :$${new_name}, :$${old_name}" "alias_method ...")
                 ("amc" "alias_method_chain :$${first_method}, :$${second_method}" "alias_method_chain ...")
                 ) ; general
             (:m "definitions" ruby-mode-abbrev-table
                 ("ts" "require \"test/unit\"\n\nrequire \"tc_$${test_case_file}\"\nrequire \"tc_$${test_case_file}\"\n" "require \"tc_...\" ...")
                 ("tc" "require \"test/unit\"\n\nrequire \"$${library_file_name}\"\n\nclass Test$${amp} < Test::Unit::TestCase\n$>def test_$${case_name}\n$>$>$.\n$>end\n$>end" "class ... < Test::Unit::TestCase ... end")
                 ("sin" "class << self; self end" "singleton_class()")
                 ("rw" "attr_accessor :$${attr_names}" "attr_accessor ...")
                 ("req" "require \"$.\"" "require \"...\"")
                 ("modf" "module $${ModuleName}\n$>module ClassMethods\n$>$>$.\n$>end\n$>\n$>extend ClassMethods\n$>\n$>def self.included(receiver)\n$>$>receiver.extend(ClassMethods)\n$>end\n$>\n$>\n$>end" "module ... ClassMethods ... end")
                 ("mods" "module $${ModuleName}\n$>$.\n$>end" "module ... end")
                 ("modu" "module $${ModuleName}\n$>module_function\n$>\n$>$.\n$>end" "module ... module_function ... end")
                 ("mm" "def method_missing(meth, *args, &block)\n$>$.\n$>end" "def method_missing ... end")
                 ("hash" "Hash.new { |$${hash}, $${key}| $${hash}[$${key}] = $. }" "Hash.new { |hash, key| hash[key] = ... }")
                 ("forw" "extend Forwardable" "extend Forwardable")
                 ("enum" "include Enumerable\n\ndef each(&block)\n$>$.\n$>end" "include Enumerable ...")
                 ("elsif" "elsif $${condition}\n$>$." "elsif ...")
                 ("doo" "do |$${object}|\n$>$.\n$>end" "Insert do |object| ... end")
                 ("defd" "def_delegator :$${del_obj}, :$${del_meth}, :$${new_name}" "def_delegator ...")
                 ("defds" "def_delegators :$${del_obj}, :$${del_methods}" "def_delegators ...")
                 ("defs" "def self.$${class_method_name}\n$>$.\n$>end" "def self ... end")
                 ("deft" "def test_$${case_name}\n$>$.\n$>end" "def test_ ... end")
                 ("dee" "Marshal.load(Marshal.dump($${obj_to_copy}))" "deep_copy(...)")
                 ("comp" "include Comparable\n\ndef <=>(other)\n$>$.\n$>end" "include Comparable ...")
                 ("cladl" "class $${ClassName} < DelegateClass($${ParentClass})\n$>def initialize$${1}\n$>$>super($${del_obj})\n$>$>\n$>$>$.\n$>end\n$>\n$>\n$>end" "class ... < DelegateClass ... initialize ... end")
                 ("clapr" "class $${ClassName} < $${ParentClass}\n$>def initialize$${1}\n$>$>$.\n$>end\n$>\n$>\n$>end" "class ... < ParentClass ... initialize ... end")
                 ("clast" "class $${ClassName} < Struct.new(:$${attr_names})\n$>def initialize(*args)\n$>$>super\n$>$>\n$>$>$.\n$>end\n$>\n$>\n$>end" "class ... < Struct ... initialize ... end")
                 ("class" "class $${ClassName}\n$>$.\n$>end" "class ... end")
                 ("classi" "class $${ClassName}\n$>def initialize$${1}\n$>$>$.\n$>end\n$>\n$>\n$>end" "class ... initialize ... end")
                 ("clasf" "class << $${self}\n$>$.\n$>end" "class << self ... end")
                 ) ; definitions
             (:m "conditions" ruby-mode-abbrev-table
                 ("if:" "$${cond} ? $${match} : $${not_match}" "cond ? ... : ...")
                 ("ife" "if $${condition}\n$>$${2}\nelse\n$>$${3}\n$>end" "if ... else ... end")
                 ("if" "if $${condition}\n$>$.\n$>end" "if ... end")
                 ("case" "case $${object}\nwhen $${condition}\n$>$.\n$>end" "case ... end")
                 ) ; conditions
             (:m "collections" ruby-mode-abbrev-table
                 ("sorb" "sort_by { |$${e}| $. }" "sort_by { |e| ... }")
                 ("sor" "sort { |a, b| $. }" "sort { |a, b| ... }")
                 ("sel" "select { |$${e}| $. }" "select { |e| ... }")
                 ("reve" "reverse_each { |$${e}| $. }" "reverse_each { |e| ... }")
                 ("reject" "reject { |$${element}| $${element}.$. }" "reject element")
                 ("rej" "reject { |$${e}| $. }" "reject { |e| ... }")
                 ("ran" "sort_by { rand }" "randomize()")
                 ("par" "partition { |$${e}| $. }" "partition { |e| ... }")
                 ("mapwi" "enum_with_index.map { |$${e}, $${i}| $. }" "map_with_index { |e, i| ... }")
                 ("inject" "inject($${object}) { |$${injection}, $${element}| $${4} }$." "inject object")
                 ("inj" "inject($${init}) { |$${mem}, $${var}| $. }" "inject(init) { |mem, var| ... }")
                 ("flao" "inject(Array.new) { |$${arr}, $${a}| $${arr}.push(*$${a}) }" "flatten_once()")
                 ("fina" "find_all { |$${e}| $. }" "find_all { |e| ... }")
                 ("fin" "find { |$${e}| $. }" "find { |e| ... }")
                 ("fil" "fill($${range}) { |$${i}|$. }" "fill(range) { |i| ... }")
                 ("fet" "fetch($${name}) { |$${key}|$. }" "fetch(name) { |key| ... }")
                 ("eawi" "each_with_index { |$${e}, $${i}| $. }" "each_with_index { |e, i| ... }")
                 ("eai" "each_index { |$${i}| $. }" "each_index { |i| ... }")
                 ("eak" "each_key { |$${key}| $. }" "each_key { |key| ... }")
                 ("eal" "each_line$${1} { |$${line}| $. }" "each_line { |line| ... }")
                 ("eap" "each_pair { |$${name}, $${val}| $. }" "each_pair { |name, val| ... }")
                 ("eas" "each_slice($${2}) { |$${group}| $. }" "each_slice(...) { |group| ... }")
                 ("eav" "each_value { |$${val}| $. }" "each_value { |val| ... }")
                 ("eac" "each_cons($${2}) { |$${group}| $. }" "each_cons(...) { |group| ... }")
                 ("eab" "each_byte { |$${byte}| $. }" "each_byte { |byte| ... }")
                 ("ea" "each { |$${e}| $. }" "each { |e| ... }")
                 ("det" "detect { |$${e}| $. }" "detect { |e| ... }")
                 ("deli" "delete_if { |$${e}| $. }" "delete_if { |e| ... }")
                 ("col" "collect { |$${e}| $. }" "collect { |e| ... }")
                 ("cl" "classify { |$${e}| $. }" "classify { |e| ... }")
                 ) ; collections
             )
        '(:m "rhtml" html-mode-abbrev-table html-helper-mode-abbrev-table nxml-mode-abbrev-table
             ("textarea" "<textarea name=\"$${Name}\" rows=\"$${8}\" cols=\"$${40}\">$.</textarea>" "textarea")
             ("scriptsrc" "<script src=\"$${1}\" type=\"text/javascript\" charset=\"$${utf}\"></script>" "script with source")
             ("link" "<link rel=\"$${stylesheet}\" href=\"$${master}\" type=\"text/css\" media=\"$${screen}\" title=\"$${title}\" charset=\"$${utf}\"/>" "link")
             ("licai" "<%= link_to \"$${text}\", :controller => \"$${items}\", :action => \"$${edit}\", :id => $${item} %>" "link_to (controller, action, id)")
             ("lica" "<%= link_to \"$${text}\", :controller => \"$${items}\", :action => \"$${index}\" %>" "link_to (controller, action)")
             ("lica" "<%= link_to \"$${text}\", :controller => \"$${items}\", :action => \"$${index}\" %>" "link_to (controller, action)")
             ("liai" "<%= link_to \"$${text}\", :action => \"$${edit}\", :id => $${item} %>" "link_to (action, id)")
             ("lic" "<%= link_to \"$${text}\", :controller => \"$${items}\" %>" "link_to (controller)")
             ("lia" "<%= link_to \"$${text}\", :action => \"$${index}\" %>" "link_to (action)")
             ("ft" "<%= form_tag :action => \"$${update}\" %>\n$.\n<%= end_form_tag %>" "form_tag")
             ("ff" "<%= form_form :$${item}, @$${object}, :action => \"$${update}\" %>\n$.\n<% emd %>" "form_for")
             ("form" "<form action=\"$${action}\" method=\"$${post}\" accept-charset=\"utf-8\">\n$>$.\n\n$><p><input type=\"submit\" value=\"Continue &rarr;\"/></p>\n</form>" "form")
             ("dtht" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\n$>\"http://www.w3.org/TR/html4/strict.dtd\">\n" "HTML -- 4.01 Strict")
             ("dchttr" "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n$>\"http://www.w3.org/TR/html4/loose.dtd\">\n" "HTML -- 4.01 Transitional")
             ("dcxmlf" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"\n$>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">\n" "XHTML -- 1.0 Frameset")
             ("dcxmls" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n$>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n" "XHTML -- 1.0 Strict")
             ("dcxmlt" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n$>\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" "XHTML -- 1.0 Transitional")
             ("dcxml1" "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n$>\"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">\n" "XHTML -- 1.1")
             ("body" "<body id=\"$${id}\" $${onload}>\n$>$.\n</body>" "body")
             ("div" "<div>\n$>$${paste}\n</div>" "div")
             ("%h" "<%=h $${@item} %>" "<% h ... %>")
             ("%if" "<% if $${cond} -%>\n$.\n<% end -%>" "<% if/end %>")
             ("%ifel" "<% if $${cond} -%>\n$.\n<% else -%>\n<% end -%>" "<% if/else/end %>")
             ("%unless" "<% unless $${cond} -%>\n$.\n<% end -%>" "<% unless/end %>")
             ("%for" "<% for $${elem} in @$${list} %>\n$>$.\n<% end %>$>" "<% for/end %>")
             ("%" "<% $. -%>" "<% ... %>")
             ("%%" "<%= $. %>" "<%= ... %>")
             ) ; rhtml
        '(:m "render" ruby-mode-abbrev-table
             ("rps" "render :partial => \"$${item}\", :status => $${500}" "render (partial, status)")
             ("rt" "render :text => \"$${render}\"" "render (text)")
             ("rtl" "render :text => \"$${render}\", :layout => \"$${layoutname}\"" "render (text, layout)")
             ("rtlt" "render :text => \"$${render}\", :layout => $${true}" "render (text, layout => true)")
             ("rts" "render :text => \"$${render}\", :status => $${401}" "render (text, status)")
             ("rf" "render :file => \"$${filepath}\"" "render (file)")
             ("rfu" "render :file => \"$${filepath}\", :use_full_path => $${false}" "render (file, use_full_path)")
             ("ri" "render :inline => \"$${hello}\"" "render (inline)")
             ("ril" "render :inline => \"$${hello}\", :locals => { $${name} => \"$${value}\"$${4} }" "render (inline, locals)")
             ("rit" "render :inline => \"$${hello}\", :type => $${rxml}" "render (inline, type)")
             ("rl" "render :layout => \"$${layoutname}\"" "render (layout)")
             ("rn" "render :nothing => $${true}" "render (nothing)")
             ("rns" "render :nothing => $${true}, :status => $${401}" "render (nothing, status)")
             ("rp" "render :partial => \"$${item}\"" "render (partial)")
             ("rpc" "render :partial => \"$${item}\", :collection => $${items}" "render (partial, collection)")
             ("rpl" "render :partial => \"$${item}\", :locals => { :$${name} => \"$${value}\"$${4} }" "render (partial, locals)")
             ("rpo" "render :partial => \"$${item}\", :object => $${object}" "render (partial, object)")
             ("rcea" "render_component :action => \"$${index}\"" "render_component (action)")
             ("rcec" "render_component :controller => \"$${items}\"" "render_component (controller)")
             ("rceca" "render_component :controller => \"$${items}\", :action => \"$${index}\"" "render_component (controller, action)")
             ("ra" "render :action => \"$${action}\"" "render (action)")
             ("ral" "render :action => \"$${action}\", :layout => \"$${layoutname}\"" "render (action, layout)")
             ) ; render
        '(:m "redirect_to" ruby-mode-abbrev-table
             ("rea" "redirect_to :action => \"$${index}\"" "redirect_to (action)")
             ("reai" "redirect_to :action => \"$${show}\", :id => $${item}" "redirect_to (action, id)")
             ("rec" "redirect_to :controller => \"$${items}\"" "redirect_to (controller)")
             ("reca" "redirect_to :controller => \"$${items}\", :action => \"$${list}\"" "redirect_to (controller, action)")
             ("recai" "redirect_to :controller => \"$${items}\", :action => \"$${show}\", :id => $${item}" "redirect_to (controller, action, id)")
             ) ; redirect_to
        '(:m "model" ruby-mode-abbrev-table
             ("nr" "@$${item}.new_record?" "item.new_record?")
             ("va" "validates_associated :$${attribute}" "validates_associated")
             ("vc" "validates_confirmation_of :$${attribute}" "validates_confirmation_of")
             ("ve" "validates_exclusion_of :$${attribute}" "validates_exclusion_of")
             ("vpif" "validates_presence_of :$${attribute}, :if => proc { |obj| $${condition} }" "validates_presence_of if")
             ("vu" "validates_uniqueness_of :$${attribute}" "validates_uniqueness_of")
             ("vpif" "validates_presence_of :$${attribute}, :if => proc { |obj| $${condition} }" "validates_presence_of if")
             ("vp" "validates_presence_of :$${attribute}" "validates_presence_of")
             ("vl" "validates_length_of :$${attribute}, :within => $${20}" "validates_length_of")
             ("bt" "belongs_to :$${model}" "belongs_to")
             ("hm" "has_many :$${objects}" "has_many")
             ("ho" "has_one :$${object}" "has_one")
             ("habtm" "has_and_belongs_to_many :$${object}" "has_and_belongs_to_many")
             ) ; model
        '(:m "migrations" ruby-mode-abbrev-table
             ("mtclm" "t.column :$${title}, :$${string}\n$>mtclm$." "create several columns")
             ("mac" "add_column :$${table}, :$${column}, :$${string}" "add column")
             ("mai" "add_index :$${table}, $${column}" "add index")
             ("mtcl" "t.column :$${title}, :$${string}$." "create column")
             ("mrmc" "remove_column :$${table}, :$${column}" "remove column")
             ("mrec" "rename_column :$${column}, :$${new_column}" "rename column")
             ("mdt" "drop_table :$${table}\n$." "drop table")
             ("mrt" "rename_table :$${table}, :$${new_name}$." "rename table")
             ) ; migrations
        '(:m "environment" ruby-mode-abbrev-table
             ("logd" "logger.debug \"$${message}\"$." "logger.debug")
             ("loge" "logger.error \"$${message}\"$." "logger.error")
             ("logf" "logger.fatal \"$${message}\"$." "logger.fatal")
             ("logi" "logger.info \"$${message}\"$." "logger.info")
             ("logw" "logger.warn \"$${message}\"$." "logger.warn")
             ) ; environment
        '(:m "assertions" ruby-mode-abbrev-table
             ("ase" "assert_equal($${expected}, $${actual})" "assert_equal(...)")
             ("asid" "assert_in_delta($${expected_float}, $${actual_float}, $${20})" "assert_in_delta(...)")
             ("asio" "assert_instance_of($${ExpectedClass}, $${actual_instance})" "assert_instance_of(...)")
             ("asko" "assert_kind_of($${ExpectedKind}, $${actual_instance})" "assert_kind_of(...)")
             ("asm" "assert_match(/$${expected_pattern}/, $${actual_string})" "assert_match(...)")
             ("asn" "assert_nil($${instance})" "assert_nil(...)")
             ("asne" "assert_not_equal($${unexpected}, $${actual})" "assert_not_equal(...)")
             ("asnm" "assert_no_match(/$${unexpected_pattern}/, $${actual_string})" "assert_no_match(...)")
             ("asnn" "assert_not_nil($${instance})" "assert_not_nil(...)")
             ("asnr" "assert_nothing_raised($${Exception}) { $. }" "assert_nothing_raised(...) { ... }")
             ("asns" "assert_not_same($${unexpected}, $${actual})" "assert_not_same(...)")
             ("asnt" "assert_nothing_thrown { $. }" "assert_nothing_thrown { ... }")
             ("aso" "assert_operator($${left}, :$${operator}, $${right})" "assert_operator(...)")
             ("asr" "assert_raise($${Exception}) { $. }" "assert_raise(...) { ... }")
             ("asre" "assert_response :$${success}" "assert_response")
             ("asrt" "assert_respond_to($${object}, :$${method})" "assert_respond_to(...)")
             ("ast" "assert_throws(:$${expected}) { $. }" "assert_throws(...) { ... }")
             ) ; assertions
        )
  )

(provide 'rails-snippets)
