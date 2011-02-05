<?xml version="1.0"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>~python-mode-devs/python-mode/python-mode : contents of pycomplete.el at revision 351</title>
<link href="/static/css/global.css" rel="stylesheet" />

<script type="text/javascript">
var global_path = 'http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/';
var collapsed_icon_path = '/static/images/treeCollapsed.png';
var expanded_icon_path = '/static/images/treeExpanded.png';
</script>
<script src="/static/javascript/yui/build/yui/yui-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/oop/oop-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/event/event-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/attribute/attribute-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/base/base-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/dom/dom-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/node/node-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/anim/anim-min.js" type="text/javascript"></script>
<script src="/static/javascript/yui/build/io/io-base-min.js" type="text/javascript"></script>
<script src="/static/javascript/custom.js" type="text/javascript"></script>

<link href="/static/css/annotate.css" media="all" type="text/css" rel="stylesheet" />
<link href="/static/css/highlight.css" media="all" type="text/css" rel="stylesheet" />

</head>
<body>


<ul id="menuTabs">


<li><a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/changes" title="Changes">Changes</a></li>
<li><a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/files" title="Files" id="on">Files</a></li>
<li><a href="https://help.launchpad.net/Loggerhead" title="Help">Help</a></li>

</ul>

<div id="loggerheadCont">
<div id="search_terms"></div>
<h1>

<a href="https://code.launchpad.net/~python-mode-devs/python-mode/python-mode">~python-mode-devs/python-mode/python-mode</a>


<span>: <span class="breadcrumb">
/pycomplete.el
</span> (revision 351)</span>
</h1>
<div>

<ul id="submenuTabs">
<li id="first">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/files/351">browse files</a>
</li>
<li>
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/revision/351">view revision</a>
</li>
<li>
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/changes?filter_file_id=401%40fb98634b-d22b-0410-a57a-e996bee27b70%3Atrunk%252Fpython-mode%3Apycomplete.el">view changes to this file</a>
</li>
<li id="last">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/download/head%3A/401%40fb98634b-d22b-0410-a57a-e996bee27b70%3Atrunk%252Fpython-mode%3Apycomplete.el/pycomplete.el">download file</a>
</li>
</ul>
<div class="annotate">
<table id="logentries">
<tr class="logheader">
<td class="annoLineTit">Line</td>
<td class="annoRevTit">Revision</td>
<td class="annoContTit">Contents</td>
</tr>
<tr class="blueRow1">
<td class="annoLine"><a id="L1" href="#L1">1</a></td>
<td class="annoRev">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/revision/275" title="275 by montanaro, on 21 Oct 2004 22:14 (2004-10-21 22:14:10)">275</a>
</td>
<td class="annoCont"><pre><span class="pyg-c1">;;; Complete symbols at point using Pymacs.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L2" href="#L2">2</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L3" href="#L3">3</a></td>
<td class="annoRev">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/revision/338" title="338 by montanaro, on 06 Feb 2008 02:21 (2008-02-06 02:21:41)">338</a>
</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Copyright (C) 2007  Skip Montanaro</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L4" href="#L4">4</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L5" href="#L5">5</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Author:     Skip Montanaro</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L6" href="#L6">6</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Maintainer: skip@pobox.com</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L7" href="#L7">7</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Created:    Oct 2004</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L8" href="#L8">8</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Keywords:   python pymacs emacs</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L9" href="#L9">9</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L10" href="#L10">10</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; This software is provided as-is, without express or implied warranty.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L11" href="#L11">11</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Permission to use, copy, modify, distribute or sell this software,</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L12" href="#L12">12</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; without fee, for any purpose and by any individual or organization, is</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L13" href="#L13">13</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; hereby granted, provided that the above copyright notice and this</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L14" href="#L14">14</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; paragraph appear in all copies.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L15" href="#L15">15</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L16" href="#L16">16</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; Along with pycomplete.py this file allows programmers to complete Python</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L17" href="#L17">17</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; symbols within the current buffer.  See pycomplete.py for the Python side</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L18" href="#L18">18</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c1">;; of things and a short description of what to expect.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L19" href="#L19">19</a></td>
<td class="annoRev">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/revision/275" title="275 by montanaro, on 21 Oct 2004 22:14 (2004-10-21 22:14:10)">275</a>
</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L20" href="#L20">20</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nb">require</span><span class="pyg-"> </span><span class="pyg-ss">&#39;pymacs</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L21" href="#L21">21</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nb">require</span><span class="pyg-"> </span><span class="pyg-ss">&#39;python-mode</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L22" href="#L22">22</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L23" href="#L23">23</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nv">pymacs-load</span><span class="pyg-"> </span><span class="pyg-s">&quot;pycomplete&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L24" href="#L24">24</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L25" href="#L25">25</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nb">defun</span><span class="pyg-"> </span><span class="pyg-nv">py-complete</span><span class="pyg-"> </span><span class="pyg-p">()</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L26" href="#L26">26</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">  </span><span class="pyg-p">(</span><span class="pyg-nv">interactive</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L27" href="#L27">27</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">  </span><span class="pyg-p">(</span><span class="pyg-k">let</span><span class="pyg-"> </span><span class="pyg-p">((</span><span class="pyg-nv">pymacs-forget-mutability</span><span class="pyg-"> </span><span class="pyg-no">t</span><span class="pyg-p">))</span><span class="pyg-"> </span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L28" href="#L28">28</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-p">(</span><span class="pyg-nv">insert</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">pycomplete-pycomplete</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">py-symbol-near-point</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L29" href="#L29">29</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">				   </span><span class="pyg-p">(</span><span class="pyg-nv">py-find-global-imports</span><span class="pyg-p">)))))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L30" href="#L30">30</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L31" href="#L31">31</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nb">defun</span><span class="pyg-"> </span><span class="pyg-nv">py-find-global-imports</span><span class="pyg-"> </span><span class="pyg-p">()</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L32" href="#L32">32</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">  </span><span class="pyg-p">(</span><span class="pyg-nv">save-excursion</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L33" href="#L33">33</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-p">(</span><span class="pyg-k">let</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">first-class-or-def</span><span class="pyg-"> </span><span class="pyg-nv">imports</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L34" href="#L34">34</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">      </span><span class="pyg-p">(</span><span class="pyg-nv">goto-char</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">point-min</span><span class="pyg-p">))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L35" href="#L35">35</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">      </span><span class="pyg-p">(</span><span class="pyg-k">setq</span><span class="pyg-"> </span><span class="pyg-nv">first-class-or-def</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L36" href="#L36">36</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">	    </span><span class="pyg-p">(</span><span class="pyg-nv">re-search-forward</span><span class="pyg-"> </span><span class="pyg-s">&quot;^ *\\(def\\|class\\) &quot;</span><span class="pyg-"> </span><span class="pyg-no">nil</span><span class="pyg-"> </span><span class="pyg-no">t</span><span class="pyg-p">))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L37" href="#L37">37</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">      </span><span class="pyg-p">(</span><span class="pyg-nv">goto-char</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">point-min</span><span class="pyg-p">))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L38" href="#L38">38</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">      </span><span class="pyg-p">(</span><span class="pyg-k">setq</span><span class="pyg-"> </span><span class="pyg-nv">imports</span><span class="pyg-"> </span><span class="pyg-no">nil</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L39" href="#L39">39</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">      </span><span class="pyg-p">(</span><span class="pyg-nv">while</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">re-search-forward</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L40" href="#L40">40</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">	      </span><span class="pyg-s">&quot;^\\(import \\|from \\([A-Za-z_][A-Za-z_0-9]*\\) import \\).*&quot;</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L41" href="#L41">41</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">	      </span><span class="pyg-no">nil</span><span class="pyg-"> </span><span class="pyg-no">t</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L42" href="#L42">42</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">	</span><span class="pyg-p">(</span><span class="pyg-k">setq</span><span class="pyg-"> </span><span class="pyg-nv">imports</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nb">append</span><span class="pyg-"> </span><span class="pyg-nv">imports</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L43" href="#L43">43</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">			      </span><span class="pyg-p">(</span><span class="pyg-nb">list</span><span class="pyg-"> </span><span class="pyg-p">(</span><span class="pyg-nv">buffer-substring</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L44" href="#L44">44</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">				     </span><span class="pyg-p">(</span><span class="pyg-nv">match-beginning</span><span class="pyg-"> </span><span class="pyg-mi">0</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L45" href="#L45">45</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">				     </span><span class="pyg-p">(</span><span class="pyg-nv">match-end</span><span class="pyg-"> </span><span class="pyg-mi">0</span><span class="pyg-p">))))))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L46" href="#L46">46</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">      </span><span class="pyg-nv">imports</span><span class="pyg-p">)))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L47" href="#L47">47</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L48" href="#L48">48</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nv">define-key</span><span class="pyg-"> </span><span class="pyg-nv">py-mode-map</span><span class="pyg-"> </span><span class="pyg-s">&quot;\M-\C-i&quot;</span><span class="pyg-">  </span><span class="pyg-ss">&#39;py-complete</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L49" href="#L49">49</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L50" href="#L50">50</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-p">(</span><span class="pyg-nb">provide</span><span class="pyg-"> </span><span class="pyg-ss">&#39;pycomplete</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr>
</table>
</div>
</div>
<p class="fl">Loggerhead is a web-based interface for <a href="http://bazaar-vcs.org/">Bazaar</a> branches</p>
</div>
</body>
</html>