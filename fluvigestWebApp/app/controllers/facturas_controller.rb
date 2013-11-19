


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>fluvigest/fluvigestWebApp/app/controllers/facturas_controller.rb at facturacion · udc-fic-cait-md/fluvigest</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="https://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta property="og:image" content="https://github.global.ssl.fastly.net/images/modules/logos_page/Octocat.png">
    <meta name="hostname" content="github-fe134-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 1.9.3p194-tcs-github-tcmalloc (0e75de19f8) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035/">
    <link rel="xhr-socket" href="/_sockets" />
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="4F94794A:7EE4:14D4FE8:528BE0C8" name="octolytics-dimension-request_id" /><meta content="3912951" name="octolytics-actor-id" /><meta content="rene15009" name="octolytics-actor-login" /><meta content="752344e721b5280b76ebdc17221336ead5b48c03507218273324eaf279284565" name="octolytics-actor-hash" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="DvKLXRdL+e2Bs9YiIWtISB5Dw+IJBn4VXarRA7Tr1os=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-265c890d2d984076758874a74913b9a365a54c70.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-3f66132da0e6092e5488d75a80bdac16cc47fae9.css" media="all" rel="stylesheet" type="text/css" />
    

    

      <script src="https://github.global.ssl.fastly.net/assets/frameworks-44a57612125781edd26ac9122cc748f42a91ec2e.js" type="text/javascript"></script>
      <script src="https://github.global.ssl.fastly.net/assets/github-2d370177be9856b5eacfce7617fb0f5f1ae8efa9.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="e9dadc0734c476c59d9feaebcd8b4ff3">

        <link data-pjax-transient rel='permalink' href='/udc-fic-cait-md/fluvigest/blob/5b8a844760e79ffde807521e58571ad814fbdad3/fluvigestWebApp/app/controllers/facturas_controller.rb'>
  <meta property="og:title" content="fluvigest"/>
  <meta property="og:type" content="githubog:gitrepository"/>
  <meta property="og:url" content="https://github.com/udc-fic-cait-md/fluvigest"/>
  <meta property="og:image" content="https://github.global.ssl.fastly.net/images/gravatars/gravatar-user-420.png"/>
  <meta property="og:site_name" content="GitHub"/>
  <meta property="og:description" content="fluvigest - Fluvigest: Water Management System"/>

  <meta name="description" content="fluvigest - Fluvigest: Water Management System" />

  <meta content="5470809" name="octolytics-dimension-user_id" /><meta content="udc-fic-cait-md" name="octolytics-dimension-user_login" /><meta content="13808869" name="octolytics-dimension-repository_id" /><meta content="udc-fic-cait-md/fluvigest" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="13808869" name="octolytics-dimension-repository_network_root_id" /><meta content="udc-fic-cait-md/fluvigest" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/udc-fic-cait-md/fluvigest/commits/facturacion.atom" rel="alternate" title="Recent Commits to fluvigest:facturacion" type="application/atom+xml" />

  </head>


  <body class="logged_in  env-production windows vis-public  page-blob">
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/organizations/udc-fic-cait-md">
  <span class="mega-octicon octicon-mark-github"></span>
</a>

    
    <a href="/udc-fic-cait-md/fluvigest/notifications" class="notification-indicator tooltipped downwards contextually-unread" data-gotokey="n" title="You have unread notifications in this repository">
        <span class="mail-status unread"></span>
</a>

      <div class="command-bar js-command-bar  in-repository">
          <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    data-username="rene15009"
      data-repo="udc-fic-cait-md/fluvigest"
      data-branch="facturacion"
      data-sha="29031e61cb07183adb479e3159d4a0b1caada67c"
  >

    <input type="hidden" name="nwo" value="udc-fic-cait-md/fluvigest" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
        <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
            <li><a href="https://gist.github.com">Gist</a></li>
            <li><a href="/blog">Blog</a></li>
          <li><a href="https://help.github.com">Help</a></li>
        </ul>
      </div>

    


  <ul id="user-links">
    <li>
      <a href="/rene15009" class="name">
        <img height="20" src="https://0.gravatar.com/avatar/fd6a71c7b90d6c8efe156cb6154e56c9?d=https%3A%2F%2Fidenticons.github.com%2F3a7d90adda75c534a9ff9969e3718f18.png&amp;r=x&amp;s=140" width="20" /> rene15009
      </a>
    </li>

      <li>
        <a href="/new" id="new_repo" class="tooltipped downwards" title="Create a new repo" aria-label="Create a new repo">
          <span class="octicon octicon-repo-create"></span>
        </a>
      </li>

      <li>
        <a href="/settings/profile" id="account_settings"
          class="tooltipped downwards"
          aria-label="Account settings "
          title="Account settings ">
          <span class="octicon octicon-tools"></span>
        </a>
      </li>
      <li>
        <a class="tooltipped downwards" href="/logout" data-method="post" id="logout" title="Sign out" aria-label="Sign out">
          <span class="octicon octicon-log-out"></span>
        </a>
      </li>

  </ul>

<div class="js-new-dropdown-contents hidden">
  

<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo-create"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>



    <li class="section-title">
      <span title="udc-fic-cait-md/fluvigest">This repository</span>
    </li>
      <li>
        <a href="/udc-fic-cait-md/fluvigest/issues/new"><span class="octicon octicon-issue-opened"></span> New issue</a>
      </li>
</ul>

</div>


    
  </div>
</div>

      

      




          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="DvKLXRdL+e2Bs9YiIWtISB5Dw+IJBn4VXarRA7Tr1os=" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="13808869" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/udc-fic-cait-md/fluvigest/watchers">
        24
      </a>
      <span class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0">
        <span class="js-select-button">
          <span class="octicon octicon-eye-unwatch"></span>
          Unwatch
        </span>
      </span>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content">
          <div class="select-menu-header">
            <span class="select-menu-title">Notification status</span>
            <span class="octicon octicon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">You only receive notifications for discussions in which you participate or are @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye-watch"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">You receive notifications for all discussions in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye-unwatch"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">You do not receive any notifications for discussions in this repository.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
  

  <div class="js-toggler-container js-social-container starring-container ">
    <a href="/udc-fic-cait-md/fluvigest/unstar"
      class="minibutton with-count js-toggler-target star-button starred upwards"
      title="Unstar this repository" data-remote="true" data-method="post" rel="nofollow">
      <span class="octicon octicon-star-delete"></span><span class="text">Unstar</span>
    </a>

    <a href="/udc-fic-cait-md/fluvigest/star"
      class="minibutton with-count js-toggler-target star-button unstarred upwards"
      title="Star this repository" data-remote="true" data-method="post" rel="nofollow">
      <span class="octicon octicon-star"></span><span class="text">Star</span>
    </a>

      <a class="social-count js-social-count" href="/udc-fic-cait-md/fluvigest/stargazers">
        4
      </a>
  </div>

  </li>


        <li>
          <a href="/udc-fic-cait-md/fluvigest/fork" class="minibutton with-count js-toggler-target fork-button lighter upwards" title="Fork this repo" rel="facebox nofollow">
            <span class="octicon octicon-git-branch-create"></span><span class="text">Fork</span>
          </a>
          <a href="/udc-fic-cait-md/fluvigest/network" class="social-count">2</a>
        </li>


</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/udc-fic-cait-md" class="url fn" itemprop="url" rel="author"><span itemprop="title">udc-fic-cait-md</span></a>
          </span>
          <span class="repohead-name-divider">/</span>
          <strong><a href="/udc-fic-cait-md/fluvigest" class="js-current-repository js-repo-home-link">fluvigest</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    

    <div class="container">

      <div class="repository-with-sidebar repo-container  ">

        <div class="repository-sidebar">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped leftwards" title="Code">
        <a href="/udc-fic-cait-md/fluvigest/tree/facturacion" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /udc-fic-cait-md/fluvigest/tree/facturacion">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/udc-fic-cait-md/fluvigest/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /udc-fic-cait-md/fluvigest/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests"><a href="/udc-fic-cait-md/fluvigest/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /udc-fic-cait-md/fluvigest/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped leftwards" title="Wiki">
          <a href="/udc-fic-cait-md/fluvigest/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_wiki /udc-fic-cait-md/fluvigest/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>
    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/udc-fic-cait-md/fluvigest/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /udc-fic-cait-md/fluvigest/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/udc-fic-cait-md/fluvigest/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /udc-fic-cait-md/fluvigest/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/udc-fic-cait-md/fluvigest/network" aria-label="Network" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-selected-links="repo_network /udc-fic-cait-md/fluvigest/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

            <div class="only-with-full-nav">
              

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=push">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/udc-fic-cait-md/fluvigest.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/udc-fic-cait-md/fluvigest.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push">
  <h3><strong>SSH</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="git@github.com:udc-fic-cait-md/fluvigest.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="git@github.com:udc-fic-cait-md/fluvigest.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/udc-fic-cait-md/fluvigest" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/udc-fic-cait-md/fluvigest" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <span class="octicon help tooltipped upwards" title="Get help on which URL is right for you.">
    <a href="https://help.github.com/articles/which-remote-url-should-i-use">
    <span class="octicon octicon-question"></span>
    </a>
  </span>
</p>


  <a href="github-windows://openRepo/https://github.com/udc-fic-cait-md/fluvigest" class="minibutton sidebar-button">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

              <a href="/udc-fic-cait-md/fluvigest/archive/facturacion.zip"
                 class="minibutton sidebar-button"
                 title="Download this repository as a zip file"
                 rel="nofollow">
                <span class="octicon octicon-cloud-download"></span>
                Download ZIP
              </a>
            </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:6b24f572c9c60ded5796b78edb7337bf -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/udc-fic-cait-md/fluvigest/find/facturacion" data-pjax data-hotkey="t" class="js-show-file-finder" style="display:none">Show File Finder</a>

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="facturacion"
    role="button" aria-label="Switch branches or tags" tabindex="0">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">facturacion</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/udc-fic-cait-md/fluvigest/blob/contratos_dev/fluvigestWebApp/app/controllers/facturas_controller.rb"
                 data-name="contratos_dev"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="contratos_dev">contratos_dev</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/udc-fic-cait-md/fluvigest/blob/contratos_master/fluvigestWebApp/app/controllers/facturas_controller.rb"
                 data-name="contratos_master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="contratos_master">contratos_master</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/udc-fic-cait-md/fluvigest/blob/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb"
                 data-name="facturacion"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="facturacion">facturacion</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/udc-fic-cait-md/fluvigest/blob/inm_cont_dev/fluvigestWebApp/app/controllers/facturas_controller.rb"
                 data-name="inm_cont_dev"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="inm_cont_dev">inm_cont_dev</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/udc-fic-cait-md/fluvigest/blob/lecturas-dev/fluvigestWebApp/app/controllers/facturas_controller.rb"
                 data-name="lecturas-dev"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="lecturas-dev">lecturas-dev</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/udc-fic-cait-md/fluvigest/blob/master/fluvigestWebApp/app/controllers/facturas_controller.rb"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <form accept-charset="UTF-8" action="/udc-fic-cait-md/fluvigest/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" type="hidden" value="DvKLXRdL+e2Bs9YiIWtISB5Dw+IJBn4VXarRA7Tr1os=" /></div>
            <span class="octicon octicon-git-branch-create select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <h4>Create branch: <span class="js-new-item-name"></span></h4>
              <span class="description">from ‘facturacion’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="facturacion" />
            <input type="hidden" name="path" id="branch" value="fluvigestWebApp/app/controllers/facturas_controller.rb" />
          </form> <!-- /.select-menu-item -->

      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/udc-fic-cait-md/fluvigest/tree/facturacion" data-branch="facturacion" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">fluvigest</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/udc-fic-cait-md/fluvigest/tree/facturacion/fluvigestWebApp" data-branch="facturacion" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">fluvigestWebApp</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/udc-fic-cait-md/fluvigest/tree/facturacion/fluvigestWebApp/app" data-branch="facturacion" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">app</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/udc-fic-cait-md/fluvigest/tree/facturacion/fluvigestWebApp/app/controllers" data-branch="facturacion" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">controllers</span></a></span><span class="separator"> / </span><strong class="final-path">facturas_controller.rb</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="fluvigestWebApp/app/controllers/facturas_controller.rb" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  <div class="commit commit-loader file-history-tease js-deferred-content" data-url="/udc-fic-cait-md/fluvigest/contributors/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb">
    Fetching contributors…

    <div class="participation">
      <p class="loader-loading"><img alt="Octocat-spinner-32-eaf2f5" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" /></p>
      <p class="loader-error">Cannot retrieve contributors at this time</p>
    </div>
  </div>

<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>145 lines (112 sloc)</span>
        <span>3.833 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
            <a class="minibutton tooltipped leftwards"
               href="github-windows://openRepo/https://github.com/udc-fic-cait-md/fluvigest?branch=facturacion&amp;filepath=fluvigestWebApp%2Fapp%2Fcontrollers%2Ffacturas_controller.rb" title="Open this file in GitHub for Windows">
                <span class="octicon octicon-device-desktop"></span> Open
            </a>
                <a class="minibutton"
                   href="/udc-fic-cait-md/fluvigest/edit/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb"
                   data-method="post" rel="nofollow" data-hotkey="e">Edit</a>
          <a href="/udc-fic-cait-md/fluvigest/raw/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb" class="button minibutton " id="raw-url">Raw</a>
            <a href="/udc-fic-cait-md/fluvigest/blame/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb" class="button minibutton ">Blame</a>
          <a href="/udc-fic-cait-md/fluvigest/commits/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
          <a class="minibutton danger empty-icon tooltipped downwards"
             href="/udc-fic-cait-md/fluvigest/delete/facturacion/fluvigestWebApp/app/controllers/facturas_controller.rb"
             title=""
             data-method="post" data-test-id="delete-blob-file" rel="nofollow">
          Delete
        </a>
      </div><!-- /.actions -->

    </div>
        <div class="blob-wrapper data type-ruby js-blob-data">
        <table class="file-code file-diff">
          <tr class="file-code-line">
            <td class="blob-line-nums">
              <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>

            </td>
            <td class="blob-line-code">
                    <div class="highlight"><pre><div class='line' id='LC1'><span class="k">class</span> <span class="nc">FacturasController</span> <span class="o">&lt;</span> <span class="no">ApplicationController</span></div><div class='line' id='LC2'>&nbsp;&nbsp;<span class="n">before_action</span> <span class="ss">:set_factura</span><span class="p">,</span> <span class="ss">only</span><span class="p">:</span> <span class="o">[</span><span class="ss">:show</span><span class="p">,</span> <span class="ss">:edit</span><span class="p">,</span> <span class="ss">:update</span><span class="p">,</span> <span class="ss">:destroy</span><span class="o">]</span></div><div class='line' id='LC3'><br/></div><div class='line' id='LC4'>&nbsp;&nbsp;<span class="kp">include</span> <span class="no">FacturasHelper</span></div><div class='line' id='LC5'><br/></div><div class='line' id='LC6'>&nbsp;&nbsp;<span class="nb">require</span> <span class="s1">&#39;will_paginate&#39;</span></div><div class='line' id='LC7'>&nbsp;&nbsp;<span class="nb">require</span> <span class="s1">&#39;will_paginate/array&#39;</span></div><div class='line' id='LC8'><br/></div><div class='line' id='LC9'>&nbsp;&nbsp;<span class="c1"># GET /facturas</span></div><div class='line' id='LC10'>&nbsp;&nbsp;<span class="c1"># GET /facturas.json</span></div><div class='line' id='LC11'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">index</span></div><div class='line' id='LC12'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@facturas</span> <span class="o">=</span> <span class="no">Factura</span><span class="o">.</span><span class="n">all</span></div><div class='line' id='LC13'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@facturas</span> <span class="o">=</span> <span class="vi">@facturas</span><span class="o">.</span><span class="n">paginate</span><span class="p">(</span><span class="ss">:page</span> <span class="o">=&gt;</span> <span class="n">params</span><span class="o">[</span><span class="ss">:page</span><span class="o">]</span><span class="p">,</span> <span class="ss">:per_page</span> <span class="o">=&gt;</span> <span class="mi">6</span><span class="p">)</span></div><div class='line' id='LC14'><br/></div><div class='line' id='LC15'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'>&nbsp;&nbsp;<span class="c1"># GET /facturas/1</span></div><div class='line' id='LC18'>&nbsp;&nbsp;<span class="c1"># GET /facturas/1.json</span></div><div class='line' id='LC19'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">show</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@linea_facturas</span> <span class="o">=</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">linea_facturas</span><span class="o">.</span><span class="n">all</span></div><div class='line' id='LC21'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@linea_facturas</span> <span class="o">=</span> <span class="vi">@linea_facturas</span><span class="o">.</span><span class="n">paginate</span><span class="p">(</span><span class="ss">:page</span> <span class="o">=&gt;</span> <span class="n">params</span><span class="o">[</span><span class="ss">:page</span><span class="o">]</span><span class="p">,</span> <span class="ss">:per_page</span> <span class="o">=&gt;</span> <span class="mi">6</span><span class="p">)</span></div><div class='line' id='LC22'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC23'><br/></div><div class='line' id='LC24'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">show_factura</span></div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@factura</span> <span class="o">=</span> <span class="no">Factura</span><span class="o">.</span><span class="n">find</span><span class="p">(</span><span class="n">params</span><span class="o">[</span><span class="ss">:factura_id</span><span class="o">]</span><span class="p">)</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@linea_facturas</span> <span class="o">=</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">linea_facturas</span><span class="o">.</span><span class="n">all</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@total</span> <span class="o">=</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">linea_facturas</span><span class="o">.</span><span class="n">sum</span><span class="p">(</span><span class="s1">&#39;importe&#39;</span><span class="p">)</span></div><div class='line' id='LC28'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC29'><br/></div><div class='line' id='LC30'>&nbsp;&nbsp;<span class="c1"># GET /facturas/new</span></div><div class='line' id='LC31'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">new</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@factura</span> <span class="o">=</span> <span class="no">Factura</span><span class="o">.</span><span class="n">new</span></div><div class='line' id='LC33'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC34'><br/></div><div class='line' id='LC35'>&nbsp;&nbsp;<span class="c1"># GET /facturas/1/edit</span></div><div class='line' id='LC36'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">edit</span></div><div class='line' id='LC37'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC38'><br/></div><div class='line' id='LC39'>&nbsp;&nbsp;<span class="c1"># POST /facturas</span></div><div class='line' id='LC40'>&nbsp;&nbsp;<span class="c1"># POST /facturas.json</span></div><div class='line' id='LC41'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">create</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@factura</span> <span class="o">=</span> <span class="no">Factura</span><span class="o">.</span><span class="n">new</span><span class="p">(</span><span class="n">factura_params</span><span class="p">)</span></div><div class='line' id='LC43'><br/></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">respond_to</span> <span class="k">do</span> <span class="o">|</span><span class="nb">format</span><span class="o">|</span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">save</span></div><div class='line' id='LC46'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">html</span> <span class="p">{</span> <span class="n">redirect_to</span> <span class="n">facturas_path</span> <span class="p">}</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">json</span> <span class="p">{</span> <span class="n">render</span> <span class="ss">action</span><span class="p">:</span> <span class="s1">&#39;show&#39;</span><span class="p">,</span> <span class="ss">status</span><span class="p">:</span> <span class="ss">:created</span><span class="p">,</span> <span class="ss">location</span><span class="p">:</span> <span class="vi">@factura</span> <span class="p">}</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC49'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">html</span> <span class="p">{</span> <span class="n">render</span> <span class="ss">action</span><span class="p">:</span> <span class="s1">&#39;new&#39;</span> <span class="p">}</span></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">json</span> <span class="p">{</span> <span class="n">render</span> <span class="ss">json</span><span class="p">:</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">errors</span><span class="p">,</span> <span class="ss">status</span><span class="p">:</span> <span class="ss">:unprocessable_entity</span> <span class="p">}</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC53'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC54'><br/></div><div class='line' id='LC55'>&nbsp;&nbsp;<span class="c1"># PATCH/PUT /facturas/1</span></div><div class='line' id='LC56'>&nbsp;&nbsp;<span class="c1"># PATCH/PUT /facturas/1.json</span></div><div class='line' id='LC57'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">update</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">respond_to</span> <span class="k">do</span> <span class="o">|</span><span class="nb">format</span><span class="o">|</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">update</span><span class="p">(</span><span class="n">factura_params</span><span class="p">)</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">html</span> <span class="p">{</span> <span class="n">redirect_to</span> <span class="n">facturas_path</span><span class="p">}</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">json</span> <span class="p">{</span> <span class="n">head</span> <span class="ss">:no_content</span> <span class="p">}</span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">html</span> <span class="p">{</span> <span class="n">render</span> <span class="ss">action</span><span class="p">:</span> <span class="s1">&#39;edit&#39;</span> <span class="p">}</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">json</span> <span class="p">{</span> <span class="n">render</span> <span class="ss">json</span><span class="p">:</span> <span class="vi">@factura</span><span class="o">.</span><span class="n">errors</span><span class="p">,</span> <span class="ss">status</span><span class="p">:</span> <span class="ss">:unprocessable_entity</span> <span class="p">}</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC67'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC68'><br/></div><div class='line' id='LC69'>&nbsp;&nbsp;<span class="c1"># DELETE /facturas/1</span></div><div class='line' id='LC70'>&nbsp;&nbsp;<span class="c1"># DELETE /facturas/1.json</span></div><div class='line' id='LC71'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">destroy</span></div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@factura</span><span class="o">.</span><span class="n">destroy</span></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">respond_to</span> <span class="k">do</span> <span class="o">|</span><span class="nb">format</span><span class="o">|</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">html</span> <span class="p">{</span> <span class="n">redirect_to</span> <span class="n">facturas_url</span> <span class="p">}</span></div><div class='line' id='LC75'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nb">format</span><span class="o">.</span><span class="n">json</span> <span class="p">{</span> <span class="n">head</span> <span class="ss">:no_content</span> <span class="p">}</span></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC77'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC78'><br/></div><div class='line' id='LC79'>&nbsp;&nbsp;<span class="c1">##########################</span></div><div class='line' id='LC80'>&nbsp;&nbsp;<span class="c1"># GENERACION DE FACTURAS #</span></div><div class='line' id='LC81'>&nbsp;&nbsp;<span class="c1">##########################</span></div><div class='line' id='LC82'><br/></div><div class='line' id='LC83'>&nbsp;&nbsp;<span class="c1"># GET /facturas/generar</span></div><div class='line' id='LC84'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">show_generar</span></div><div class='line' id='LC85'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#@facturas = Factura.all</span></div><div class='line' id='LC86'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#periodo_ = &quot;MARZO-ABRIL&quot;</span></div><div class='line' id='LC87'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC88'><br/></div><div class='line' id='LC89'>&nbsp;&nbsp;<span class="c1"># POST /facturas/generar</span></div><div class='line' id='LC90'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">generar</span></div><div class='line' id='LC91'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">peri</span> <span class="o">=</span> <span class="n">params</span><span class="o">[</span><span class="ss">:periodo</span><span class="o">][</span><span class="mi">0</span><span class="o">]</span></div><div class='line' id='LC92'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">anho</span> <span class="o">=</span> <span class="n">params</span><span class="o">[</span><span class="ss">:anho</span><span class="o">][</span><span class="mi">0</span><span class="o">]</span></div><div class='line' id='LC93'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">fecha_inicio</span> <span class="o">=</span> <span class="n">obtener_fecha_inicio</span><span class="p">(</span><span class="n">peri</span><span class="p">,</span> <span class="n">anho</span><span class="p">)</span></div><div class='line' id='LC94'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">fecha_fin</span> <span class="o">=</span> <span class="n">obtener_fecha_fin</span><span class="p">(</span><span class="n">peri</span><span class="p">,</span> <span class="n">anho</span><span class="p">)</span></div><div class='line' id='LC95'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">#@factura = Factura.where(:fecha =&gt; fecha_inicio..fecha_fin)</span></div><div class='line' id='LC96'><br/></div><div class='line' id='LC97'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">resultados</span> <span class="o">=</span> <span class="n">generar_facturacion</span><span class="p">(</span><span class="n">peri</span><span class="p">,</span> <span class="n">anho</span><span class="p">)</span></div><div class='line' id='LC98'><br/></div><div class='line' id='LC99'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># TODO: hay que formatear las fechas</span></div><div class='line' id='LC100'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@mensaje_facturadas</span> <span class="o">=</span> <span class="s2">&quot;Se han generado </span><span class="si">#{</span><span class="n">resultados</span><span class="o">[</span><span class="s1">&#39;facturas_generadas&#39;</span><span class="o">]</span><span class="si">}</span><span class="s2"> facturas en el periodo que va &quot;</span> <span class="o">+</span></div><div class='line' id='LC101'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;desde el </span><span class="si">#{</span><span class="n">fecha_inicio</span><span class="si">}</span><span class="s2"> hasta el </span><span class="si">#{</span><span class="n">fecha_fin</span><span class="si">}</span><span class="s2">.&quot;</span></div><div class='line' id='LC102'><br/></div><div class='line' id='LC103'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="o">!</span><span class="n">resultados</span><span class="o">[</span><span class="s1">&#39;facturas_incorrectas&#39;</span><span class="o">].</span><span class="n">nil?</span> <span class="o">&amp;&amp;</span> <span class="n">resultados</span><span class="o">[</span><span class="s1">&#39;facturas_incorrectas&#39;</span><span class="o">]</span> <span class="o">!=</span> <span class="mi">0</span></div><div class='line' id='LC104'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@mensaje_error</span> <span class="o">=</span> <span class="s2">&quot;Existen </span><span class="si">#{</span><span class="n">resultados</span><span class="o">[</span><span class="s1">&#39;facturas_incorrectas&#39;</span><span class="o">]</span><span class="si">}</span><span class="s2"> facturas que se han generado con algún tipo de error. &quot;</span> <span class="o">+</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="s2">&quot;Para ver dichas facturas pulse &lt;a href=&#39;index?periodo=MARZO-ABRIL&amp;anho=2013&amp;estado=2&#39;&gt;aqu&amp;iacute;&lt;/a&gt;.&quot;</span></div><div class='line' id='LC106'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC107'><br/></div><div class='line' id='LC108'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="s1">&#39;show_generar&#39;</span></div><div class='line' id='LC109'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC110'>&nbsp;&nbsp;<span class="c1">##############################</span></div><div class='line' id='LC111'>&nbsp;&nbsp;<span class="c1"># FIN GENERACION DE FACTURAS #</span></div><div class='line' id='LC112'>&nbsp;&nbsp;<span class="c1">##############################</span></div><div class='line' id='LC113'><br/></div><div class='line' id='LC114'>&nbsp;&nbsp;<span class="k">def</span> <span class="nf">emitir</span></div><div class='line' id='LC115'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">peri</span> <span class="o">=</span> <span class="n">params</span><span class="o">[</span><span class="ss">:periodo</span><span class="o">][</span><span class="mi">0</span><span class="o">]</span></div><div class='line' id='LC116'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">anho</span> <span class="o">=</span> <span class="n">params</span><span class="o">[</span><span class="ss">:anho</span><span class="o">][</span><span class="mi">0</span><span class="o">]</span></div><div class='line' id='LC117'><br/></div><div class='line' id='LC118'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="no">Factura</span><span class="o">.</span><span class="n">where</span><span class="p">(</span><span class="ss">:periodo</span> <span class="o">=&gt;</span> <span class="n">peri</span><span class="p">,</span> <span class="ss">:estado</span> <span class="o">=&gt;</span> <span class="mi">0</span><span class="p">)</span><span class="o">.</span><span class="n">update_all</span><span class="p">(</span><span class="ss">:estado</span> <span class="o">=&gt;</span> <span class="mi">2</span><span class="p">,</span> <span class="ss">:fecha_emision</span> <span class="o">=&gt;</span> <span class="no">Time</span><span class="o">.</span><span class="n">now</span><span class="o">.</span><span class="n">utc</span><span class="p">)</span></div><div class='line' id='LC119'><br/></div><div class='line' id='LC120'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">##no siempre se emiten controlar esto</span></div><div class='line' id='LC121'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@mensaje_emitidas</span> <span class="o">=</span><span class="s2">&quot;Se han emitido las facturas.&quot;</span></div><div class='line' id='LC122'><br/></div><div class='line' id='LC123'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">render</span> <span class="s1">&#39;show_emitir&#39;</span></div><div class='line' id='LC124'><br/></div><div class='line' id='LC125'>&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC126'><br/></div><div class='line' id='LC127'>&nbsp;&nbsp;<span class="c1">#Busqueda para odernar y paginar la tabla de facturas</span></div><div class='line' id='LC128'><br/></div><div class='line' id='LC129'>&nbsp;&nbsp;<span class="kp">private</span></div><div class='line' id='LC130'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Use callbacks to share common setup or constraints between actions.</span></div><div class='line' id='LC131'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">set_factura</span></div><div class='line' id='LC132'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="vi">@factura</span> <span class="o">=</span> <span class="no">Factura</span><span class="o">.</span><span class="n">find</span><span class="p">(</span><span class="n">params</span><span class="o">[</span><span class="ss">:id</span><span class="o">]</span><span class="p">)</span></div><div class='line' id='LC133'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC134'><br/></div><div class='line' id='LC135'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1"># Never trust parameters from the scary internet, only allow the white list through.</span></div><div class='line' id='LC136'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">def</span> <span class="nf">factura_params</span></div><div class='line' id='LC137'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="n">params</span><span class="o">.</span><span class="n">require</span><span class="p">(</span><span class="ss">:factura</span><span class="p">)</span><span class="o">.</span><span class="n">permit</span><span class="p">(</span><span class="ss">:descripcion</span><span class="p">,</span> <span class="ss">:fecha_emision</span><span class="p">)</span></div><div class='line' id='LC138'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">end</span></div><div class='line' id='LC139'><br/></div><div class='line' id='LC140'><br/></div><div class='line' id='LC141'><br/></div><div class='line' id='LC142'><br/></div><div class='line' id='LC143'><br/></div><div class='line' id='LC144'><span class="k">end</span></div></pre></div>
            </td>
          </tr>
        </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2013 <span title="0.08947s from github-fe134-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/udc-fic-cait-md/fluvigest/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

  </body>
</html>

