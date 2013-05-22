#add_source 'https://rubygems.org'

gem 'inherited_resources'
gem 'kaminari'
gem 'haml'
gem 'has_scope'
gem 'responders'


gem 'formtastic'  #, :git => 'git://github.com/justinfrench/formtastic.git', :branch => '2.1-stable', :require => 'formtastic'
#gem 'formtastic-bootstrap', :git => 'git://github.com/cgunther/formtastic-bootstrap.git', :branch => 'bootstrap2-rails3-2-formtastic-2-1', :require => 'formtastic-bootstrap'


gem 'tablegrid', :git => 'git://github.com/rostchri/tablegrid.git'
gem 'railstrap', :git => 'git://github.com/rostchri/railstrap.git', :branch => 'develop'

#gem 'less-rails'
gem 'rails_kickstrap', :git => 'https://github.com/snoepkast/rails_kickstrap.git'

#gem_group :assets do
#  gem 'jquery-rails'
#  gem 'jquery-ui-rails'
#end

application 'config.time_zone = "Berlin"'
application 'config.i18n.default_locale = :de'

#environment 'config.action_mailer.default_url_options = {host: "http://yourwebsite.example.com"}', env: 'production'

initializer 'kaminari_config.rb', <<-CODE
  Kaminari.configure do |config|
    config.default_per_page = 50
    config.window = 4
    config.outer_window = 0
    config.left = 0
    config.right = 0
    config.param_name = :page
  end
CODE


file 'app/views/kaminari/_first_page.html.haml', <<-CODE
-#  Link to the "First" page
-#  available local variables
-#    url:           url to the first page
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
- unless current_page.first?
  %li{:class => "first"}
    = link_to_unless current_page.first?, railstrap_image('icon-fast-backward'), url, :remote => remote
CODE


file 'app/views/kaminari/_gap.html.haml', <<-CODE
-#  Non-link tag that stands for skipped pages...
-#  available local variables
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
%li{:class => "page gap disabled"}
  %a{:href => "#",  :onclick => "return false;"}
    = raw(t 'views.pagination.truncate')
CODE


file 'app/views/kaminari/_last_page.html.haml', <<-CODE
-#  Link to the "Last" page
-#  available local variables
-#    url:           url to the last page
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
- unless current_page.last?
  %li{:class=>"last next"}
    = link_to_unless current_page.last?, railstrap_image('icon-fast-forward'), url, {:remote => remote}
CODE


file 'app/views/kaminari/_next_page.html.haml', <<-CODE
-#  Link to the "Next" page
-#  available local variables
-#    url:           url to the next page
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
- unless current_page.last?
  %li{:class=>"next_page"}
    = link_to_unless current_page.last?, railstrap_image('icon-forward'), url, :rel => 'next', :remote => remote
CODE


file 'app/views/kaminari/_page.html.haml', <<-CODE
-#  Link showing page number
-#  available local variables
-#    page:          a page object for "this" page
-#    url:           url to this page
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
%li{:class=>"page \#{' active' if page.current? }"}
  = link_to page, url, opts = {:remote => remote, :rel => page.next? ? 'next' : page.prev? ? 'prev' : nil}
CODE


file 'app/views/kaminari/_paginator.html.haml', <<-CODE
-#  The container tag
-#  available local variables
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
-#    paginator:     the paginator that renders the pagination tags inside
= paginator.render do
  %nav.pagination
    %ul
      = first_page_tag unless current_page.first?
      = prev_page_tag unless current_page.first?
      - each_page do |page| 
        - if page.left_outer? || page.right_outer? || page.inside_window? 
          = page_tag page
        - elsif !page.was_truncated? 
          = gap_tag
      = next_page_tag unless current_page.last? 
      = last_page_tag unless current_page.last?
= raw(t('views.pagination.items',:low => collection.offset_value + 1, :high => collection.offset_value + collection.length, :total => collection.total_count))
CODE


file 'app/views/kaminari/_prev_page.html.haml', <<-CODE
-#  Link to the "Previous" page
-#  available local variables
-#    url:           url to the previous page
-#    current_page:  a page object for the currently displayed page
-#    num_pages:     total number of pages
-#    per_page:      number of items to fetch per page
-#    remote:        data-remote
- unless current_page.first?
  %li{:class=>"prev"}
    = link_to_unless current_page.first?, railstrap_image('icon-backward'), url, :rel => 'prev', :remote => remote
CODE



file 'config/locales/de_txt.yml', <<-CODE
de:
  start_at_formatted: "Beginn"
  end_at_formatted: "Ende"
  
  date:
    formats:
      short: "%b %d.%m.%Y"
      short_with_time: "%d.%m.%Y %H:%M"
      short_with_day: "%A, %d.%m.%Y"
    
  time:
    # Zeit-Formate
    formats:
      short: "%d.%m.%Y"
      short_with_time: "%d.%m.%Y %H:%M"
      short_with_day: "%A, %d.%m.%Y"

  authlogic:
    error_messages:

  authlogic:
    error_messages:
      login_blank: darf nicht leer sein
      login_not_found: ist nicht gültig
      login_invalid: darf nur Buchstaben, Nummern und Leerzeichen enthalten
      consecutive_failed_logins_limit_exceeded: Zu oft falsch angemeldet, der Account wird temporär gesperrt
      email_invalid: muss eine gültige Email-Adresse sein
      password_blank: darf nicht leer sein
      password_invalid: ist nicht gültig
      not_active: Benutzerkennung ist noch nicht freigeschaltet
      not_confirmed: Die Email-Adresse zu dieser Benutzerkennung ist noch nicht bestätigt/verifiziert
      not_approved: Account ist noch nicht freigeschaltet
      no_authentication_details: Bitte alle Felder ausfüllen
      general_credentials_error: Login/Passwort falsch
    attributes:
      user_session:
        username: Benutzername
        password: Passwort
        remember_me: Benutzeranmeldung dauerhaft speichern

  formtastic:
    yes: "Ja"
    no: "Nein"
    hints:
    
  views:
    pagination:
      first: Anfang
      last: Ende
      truncate: "..."
      items: 'Einträge %{low} - %{high} von insgesamt %{total}'

  activerecord:
    errors:
      models:    
    models:
      attributes:
CODE



file 'config/locales/de.yml', <<-CODE
de:
  date:
    abbr_day_names:
    - So
    - Mo
    - Di
    - Mi
    - Do
    - Fr
    - Sa
    abbr_month_names:
    - 
    - Jan
    - Feb
    - Mär
    - Apr
    - Mai
    - Jun
    - Jul
    - Aug
    - Sep
    - Okt
    - Nov
    - Dez
    day_names:
    - Sonntag
    - Montag
    - Dienstag
    - Mittwoch
    - Donnerstag
    - Freitag
    - Samstag
    formats:
      default: ! '%d.%m.%Y'
      long: ! '%e. %B %Y'
      short: ! '%e. %b'
    month_names:
    - 
    - Januar
    - Februar
    - März
    - April
    - Mai
    - Juni
    - Juli
    - August
    - September
    - Oktober
    - November
    - Dezember
    order:
    - :day
    - :month
    - :year
  datetime:
    distance_in_words:
      about_x_hours:
        one: etwa eine Stunde
        other: etwa %{count} Stunden
      about_x_months:
        one: etwa ein Monat
        other: etwa %{count} Monate
      about_x_years:
        one: etwa ein Jahr
        other: etwa %{count} Jahre
      almost_x_years:
        one: fast ein Jahr
        other: fast %{count} Jahre
      half_a_minute: eine halbe Minute
      less_than_x_minutes:
        one: weniger als eine Minute
        other: weniger als %{count} Minuten
      less_than_x_seconds:
        one: weniger als eine Sekunde
        other: weniger als %{count} Sekunden
      over_x_years:
        one: mehr als ein Jahr
        other: mehr als %{count} Jahre
      x_days:
        one: ein Tag
        other: ! '%{count} Tage'
      x_minutes:
        one: eine Minute
        other: ! '%{count} Minuten'
      x_months:
        one: ein Monat
        other: ! '%{count} Monate'
      x_seconds:
        one: eine Sekunde
        other: ! '%{count} Sekunden'
    prompts:
      day: Tag
      hour: Stunden
      minute: Minuten
      month: Monat
      second: Sekunden
      year: Jahr
  errors: &errors
    format: ! '%{attribute} %{message}'
    messages:
      accepted: muss akzeptiert werden
      blank: muss ausgefüllt werden
      confirmation: stimmt nicht mit der Bestätigung überein
      empty: muss ausgefüllt werden
      equal_to: muss genau %{count} sein
      even: muss gerade sein
      exclusion: ist nicht verfügbar
      greater_than: muss größer als %{count} sein
      greater_than_or_equal_to: muss größer oder gleich %{count} sein
      inclusion: ist kein gültiger Wert
      invalid: ist nicht gültig
      less_than: muss kleiner als %{count} sein
      less_than_or_equal_to: muss kleiner oder gleich %{count} sein
      not_a_number: ist keine Zahl
      not_an_integer: muss ganzzahlig sein
      odd: muss ungerade sein
      record_invalid: ! 'Gültigkeitsprüfung ist fehlgeschlagen: %{errors}'
      taken: ist bereits vergeben
      too_long: ist zu lang (nicht mehr als %{count} Zeichen)
      too_short: ist zu kurz (nicht weniger als %{count} Zeichen)
      wrong_length: hat die falsche Länge (muss genau %{count} Zeichen haben)
    template:
      body: ! 'Bitte überprüfen Sie die folgenden Felder:'
      header:
        one: ! 'Konnte %{model} nicht speichern: ein Fehler.'
        other: ! 'Konnte %{model} nicht speichern: %{count} Fehler.'
  helpers:
    select:
      prompt: Bitte wählen
    submit:
      create: ! '%{model} erstellen'
      submit: ! '%{model} speichern'
      update: ! '%{model} aktualisieren'
  number:
    currency:
      format:
        delimiter: .
        format: ! '%n %u'
        precision: 2
        separator: ! ','
        significant: false
        strip_insignificant_zeros: false
        unit: €
    format:
      delimiter: .
      precision: 2
      separator: ! ','
      significant: false
      strip_insignificant_zeros: false
    human:
      decimal_units:
        format: ! '%n %u'
        units:
          billion:
            one: Milliarde
            other: Milliarden
          million: Millionen
          quadrillion:
            one: Billiarde
            other: Billiarden
          thousand: Tausend
          trillion: Billionen
          unit: ''
      format:
        delimiter: ''
        precision: 1
        significant: true
        strip_insignificant_zeros: true
      storage_units:
        format: ! '%n %u'
        units:
          byte:
            one: Byte
            other: Bytes
          gb: GB
          kb: KB
          mb: MB
          tb: TB
    percentage:
      format:
        delimiter: ''
    precision:
      format:
        delimiter: ''
  support:
    array:
      last_word_connector: ! ' und '
      two_words_connector: ! ' und '
      words_connector: ! ', '
  time:
    am: vormittags
    formats:
      default: ! '%A, %d. %B %Y, %H:%M Uhr'
      long: ! '%A, %d. %B %Y, %H:%M Uhr'
      short: ! '%d. %B, %H:%M Uhr'
    pm: nachmittags
  # remove these aliases after 'activemodel' and 'activerecord' namespaces are removed from Rails repository
  activemodel:
    errors:
      <<: *errors
  activerecord:
    errors:
      <<: *errors
CODE


git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }
