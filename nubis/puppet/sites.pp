nubis::static { 'limed-haul':
  servername    => 'limed-haul.allzom.org',
  serveraliases => [
    'limed-haul.allizom.org',
    'limed-haul.mozilla.org',
  ],
  aliases       =>  [
    {
      alias => '/free-fox',
      path  => "/data/${project_name}/limed-haul"
    },
    {
      alias => '/firefox',
      path  => "/data/${project_name}/limed-haul"
    }
  ],
  rewrites      => [
    {
      comment      => 'Rewrite root to mozilla.org/zh-tw/',
      rewrite_rule => [ '^/$ https://www.mozilla.org/zh-TW/ [R=temp]' ]
    },
    {
      comment       => "This needs to have a L flag to make sure it doesn't catch firefox*",
      rewrite_rule  => [ '^/(firefox(/[\.a-z0-9]+)?/(firstrun|tour|whatsnew).*) https://www.mozilla.org/$1 [R=permanent,L]' ]
    },
    {
      comment      => 'This need to precede the previous rule',
      rewrite_rule => [ '^/firefox* /free-fox [R]' ]
    },
    {
      rewrite_rule =>  [ '^/community$ https://www.mozilla.org/zh-TW/contribute [R=permanent]' ]
    },
    {
      rewrite_rule => [ '^/about https://www.mozilla.org/zh-TW/about [R=permanent]' ]
    }

  ]
}
