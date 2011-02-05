<?xml version="1.0"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>~python-mode-devs/python-mode/python-mode : contents of pycomplete.py at revision 351</title>
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
/pycomplete.py
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
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/changes?filter_file_id=401%40fb98634b-d22b-0410-a57a-e996bee27b70%3Atrunk%252Fpython-mode%3Apycomplete.py">view changes to this file</a>
</li>
<li id="last">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/download/head%3A/401%40fb98634b-d22b-0410-a57a-e996bee27b70%3Atrunk%252Fpython-mode%3Apycomplete.py/pycomplete.py">download file</a>
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
<td class="annoCont"><pre><span class="pyg-sd">&quot;&quot;&quot;</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L2" href="#L2">2</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">Python dot expression completion using Pymacs.</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L3" href="#L3">3</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L4" href="#L4">4</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">This almost certainly needs work, but if you add</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L5" href="#L5">5</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L6" href="#L6">6</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">    (require &#39;pycomplete)</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L7" href="#L7">7</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L8" href="#L8">8</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">to your .xemacs/init.el file (untried w/ GNU Emacs so far) and have Pymacs</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L9" href="#L9">9</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">installed, when you hit M-TAB it will try to complete the dot expression</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L10" href="#L10">10</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">before point.  For example, given this import at the top of the file:</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L11" href="#L11">11</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L12" href="#L12">12</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">    import time</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L13" href="#L13">13</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L14" href="#L14">14</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">typing &quot;time.cl&quot; then hitting M-TAB should complete &quot;time.clock&quot;.</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L15" href="#L15">15</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L16" href="#L16">16</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">This is unlikely to be done the way Emacs completion ought to be done, but</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L17" href="#L17">17</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">it&#39;s a start.  Perhaps someone with more Emacs mojo can take this stuff and</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L18" href="#L18">18</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">do it right.</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L19" href="#L19">19</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L20" href="#L20">20</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">See pycomplete.el for the Emacs Lisp side of things.</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L21" href="#L21">21</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">&quot;&quot;&quot;</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L22" href="#L22">22</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L23" href="#L23">23</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># Author:     Skip Montanaro</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L24" href="#L24">24</a></td>
<td class="annoRev">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/revision/338" title="338 by montanaro, on 06 Feb 2008 02:21 (2008-02-06 02:21:41)">338</a>
</td>
<td class="annoCont"><pre><span class="pyg-c"># Maintainer: skip@pobox.com</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L25" href="#L25">25</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># Created:    Oct 2004</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L26" href="#L26">26</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># Keywords:   python pymacs emacs</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L27" href="#L27">27</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L28" href="#L28">28</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># This software is provided as-is, without express or implied warranty.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L29" href="#L29">29</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># Permission to use, copy, modify, distribute or sell this software, without</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L30" href="#L30">30</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># fee, for any purpose and by any individual or organization, is hereby</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L31" href="#L31">31</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># granted, provided that the above copyright notice and this paragraph</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L32" href="#L32">32</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># appear in all copies.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L33" href="#L33">33</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L34" href="#L34">34</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># Along with pycomplete.el this file allows programmers to complete Python</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L35" href="#L35">35</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># symbols within the current buffer.</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L36" href="#L36">36</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L37" href="#L37">37</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">import</span><span class="pyg-"> </span><span class="pyg-nn">sys</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L38" href="#L38">38</a></td>
<td class="annoRev">
<a href="http://bazaar.launchpad.net/%7Epython-mode-devs/python-mode/python-mode/revision/275" title="275 by montanaro, on 21 Oct 2004 22:14 (2004-10-21 22:14:10)">275</a>
</td>
<td class="annoCont"><pre><span class="pyg-k">import</span><span class="pyg-"> </span><span class="pyg-nn">os.path</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L39" href="#L39">39</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L40" href="#L40">40</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">try</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L41" href="#L41">41</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-n">x</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-n">set</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L42" href="#L42">42</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">except</span><span class="pyg-"> </span><span class="pyg-ne">NameError</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L43" href="#L43">43</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">from</span><span class="pyg-"> </span><span class="pyg-nn">sets</span><span class="pyg-"> </span><span class="pyg-k">import</span><span class="pyg-"> </span><span class="pyg-n">Set</span><span class="pyg-"> </span><span class="pyg-k">as</span><span class="pyg-"> </span><span class="pyg-n">set</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L44" href="#L44">44</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">else</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L45" href="#L45">45</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">del</span><span class="pyg-"> </span><span class="pyg-n">x</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L46" href="#L46">46</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L47" href="#L47">47</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">def</span><span class="pyg-"> </span><span class="pyg-nf">get_all_completions</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-o">=</span><span class="pyg-bp">None</span><span class="pyg-p">):</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L48" href="#L48">48</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-sd">&quot;&quot;&quot;Return contextual completion of s (string of &gt;= zero chars).</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L49" href="#L49">49</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L50" href="#L50">50</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">    If given, imports is a list of import statements to be executed first.</span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L51" href="#L51">51</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-sd">    &quot;&quot;&quot;</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L52" href="#L52">52</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-n">locald</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-p">{}</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L53" href="#L53">53</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-"> </span><span class="pyg-ow">is</span><span class="pyg-"> </span><span class="pyg-ow">not</span><span class="pyg-"> </span><span class="pyg-bp">None</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L54" href="#L54">54</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">for</span><span class="pyg-"> </span><span class="pyg-n">stmt</span><span class="pyg-"> </span><span class="pyg-ow">in</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L55" href="#L55">55</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-k">try</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L56" href="#L56">56</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">                </span><span class="pyg-k">exec</span><span class="pyg-"> </span><span class="pyg-n">stmt</span><span class="pyg-"> </span><span class="pyg-ow">in</span><span class="pyg-"> </span><span class="pyg-nb">globals</span><span class="pyg-p">(),</span><span class="pyg-"> </span><span class="pyg-n">locald</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L57" href="#L57">57</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-k">except</span><span class="pyg-"> </span><span class="pyg-ne">TypeError</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L58" href="#L58">58</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">                </span><span class="pyg-k">raise</span><span class="pyg-"> </span><span class="pyg-ne">TypeError</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-s">&quot;invalid type: </span><span class="pyg-si">%s</span><span class="pyg-s">&quot;</span><span class="pyg-"> </span><span class="pyg-o">%</span><span class="pyg-"> </span><span class="pyg-n">stmt</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L59" href="#L59">59</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L60" href="#L60">60</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-n">dots</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-n">s</span><span class="pyg-o">.</span><span class="pyg-n">split</span><span class="pyg-p">(</span><span class="pyg-s">&quot;.&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L61" href="#L61">61</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-ow">not</span><span class="pyg-"> </span><span class="pyg-n">s</span><span class="pyg-"> </span><span class="pyg-ow">or</span><span class="pyg-"> </span><span class="pyg-nb">len</span><span class="pyg-p">(</span><span class="pyg-n">dots</span><span class="pyg-p">)</span><span class="pyg-"> </span><span class="pyg-o">==</span><span class="pyg-"> </span><span class="pyg-mf">1</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L62" href="#L62">62</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">keys</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-n">set</span><span class="pyg-p">()</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L63" href="#L63">63</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">keys</span><span class="pyg-o">.</span><span class="pyg-n">update</span><span class="pyg-p">(</span><span class="pyg-n">locald</span><span class="pyg-o">.</span><span class="pyg-n">keys</span><span class="pyg-p">())</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L64" href="#L64">64</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">keys</span><span class="pyg-o">.</span><span class="pyg-n">update</span><span class="pyg-p">(</span><span class="pyg-nb">globals</span><span class="pyg-p">()</span><span class="pyg-o">.</span><span class="pyg-n">keys</span><span class="pyg-p">())</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L65" href="#L65">65</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">import</span><span class="pyg-"> </span><span class="pyg-nn">__builtin__</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L66" href="#L66">66</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">keys</span><span class="pyg-o">.</span><span class="pyg-n">update</span><span class="pyg-p">(</span><span class="pyg-nb">dir</span><span class="pyg-p">(</span><span class="pyg-n">__builtin__</span><span class="pyg-p">))</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L67" href="#L67">67</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">keys</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-nb">list</span><span class="pyg-p">(</span><span class="pyg-n">keys</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L68" href="#L68">68</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">keys</span><span class="pyg-o">.</span><span class="pyg-n">sort</span><span class="pyg-p">()</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L69" href="#L69">69</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-n">s</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L70" href="#L70">70</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-k">return</span><span class="pyg-"> </span><span class="pyg-p">[</span><span class="pyg-n">k</span><span class="pyg-"> </span><span class="pyg-k">for</span><span class="pyg-"> </span><span class="pyg-n">k</span><span class="pyg-"> </span><span class="pyg-ow">in</span><span class="pyg-"> </span><span class="pyg-n">keys</span><span class="pyg-"> </span><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-n">k</span><span class="pyg-o">.</span><span class="pyg-n">startswith</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">)]</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L71" href="#L71">71</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">else</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L72" href="#L72">72</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-k">return</span><span class="pyg-"> </span><span class="pyg-n">keys</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L73" href="#L73">73</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L74" href="#L74">74</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-n">sym</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-bp">None</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L75" href="#L75">75</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">for</span><span class="pyg-"> </span><span class="pyg-n">i</span><span class="pyg-"> </span><span class="pyg-ow">in</span><span class="pyg-"> </span><span class="pyg-nb">range</span><span class="pyg-p">(</span><span class="pyg-mf">1</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-nb">len</span><span class="pyg-p">(</span><span class="pyg-n">dots</span><span class="pyg-p">)):</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L76" href="#L76">76</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">s</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-s">&quot;.&quot;</span><span class="pyg-o">.</span><span class="pyg-n">join</span><span class="pyg-p">(</span><span class="pyg-n">dots</span><span class="pyg-p">[:</span><span class="pyg-n">i</span><span class="pyg-p">])</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L77" href="#L77">77</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">try</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L78" href="#L78">78</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-n">sym</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-nb">eval</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-nb">globals</span><span class="pyg-p">(),</span><span class="pyg-"> </span><span class="pyg-n">locald</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L79" href="#L79">79</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">except</span><span class="pyg-"> </span><span class="pyg-ne">NameError</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L80" href="#L80">80</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-k">try</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L81" href="#L81">81</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">                </span><span class="pyg-n">sym</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-nb">__import__</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-nb">globals</span><span class="pyg-p">(),</span><span class="pyg-"> </span><span class="pyg-n">locald</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-p">[])</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L82" href="#L82">82</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">            </span><span class="pyg-k">except</span><span class="pyg-"> </span><span class="pyg-ne">ImportError</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L83" href="#L83">83</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">                </span><span class="pyg-k">return</span><span class="pyg-"> </span><span class="pyg-p">[]</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L84" href="#L84">84</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-n">sym</span><span class="pyg-"> </span><span class="pyg-ow">is</span><span class="pyg-"> </span><span class="pyg-ow">not</span><span class="pyg-"> </span><span class="pyg-bp">None</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L85" href="#L85">85</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-n">s</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-n">dots</span><span class="pyg-p">[</span><span class="pyg-o">-</span><span class="pyg-mf">1</span><span class="pyg-p">]</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L86" href="#L86">86</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">        </span><span class="pyg-k">return</span><span class="pyg-"> </span><span class="pyg-p">[</span><span class="pyg-n">k</span><span class="pyg-"> </span><span class="pyg-k">for</span><span class="pyg-"> </span><span class="pyg-n">k</span><span class="pyg-"> </span><span class="pyg-ow">in</span><span class="pyg-"> </span><span class="pyg-nb">dir</span><span class="pyg-p">(</span><span class="pyg-n">sym</span><span class="pyg-p">)</span><span class="pyg-"> </span><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-n">k</span><span class="pyg-o">.</span><span class="pyg-n">startswith</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">)]</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L87" href="#L87">87</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L88" href="#L88">88</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">def</span><span class="pyg-"> </span><span class="pyg-nf">pycomplete</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-o">=</span><span class="pyg-bp">None</span><span class="pyg-p">):</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L89" href="#L89">89</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-n">completions</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-n">get_all_completions</span><span class="pyg-p">(</span><span class="pyg-n">s</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L90" href="#L90">90</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-n">dots</span><span class="pyg-"> </span><span class="pyg-o">=</span><span class="pyg-"> </span><span class="pyg-n">s</span><span class="pyg-o">.</span><span class="pyg-n">split</span><span class="pyg-p">(</span><span class="pyg-s">&quot;.&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L91" href="#L91">91</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">return</span><span class="pyg-"> </span><span class="pyg-n">os</span><span class="pyg-o">.</span><span class="pyg-n">path</span><span class="pyg-o">.</span><span class="pyg-n">commonprefix</span><span class="pyg-p">([</span><span class="pyg-n">k</span><span class="pyg-p">[</span><span class="pyg-nb">len</span><span class="pyg-p">(</span><span class="pyg-n">dots</span><span class="pyg-p">[</span><span class="pyg-o">-</span><span class="pyg-mf">1</span><span class="pyg-p">]):]</span><span class="pyg-"> </span><span class="pyg-k">for</span><span class="pyg-"> </span><span class="pyg-n">k</span><span class="pyg-"> </span><span class="pyg-ow">in</span><span class="pyg-"> </span><span class="pyg-n">completions</span><span class="pyg-p">])</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L92" href="#L92">92</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L93" href="#L93">93</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-k">if</span><span class="pyg-"> </span><span class="pyg-n">__name__</span><span class="pyg-"> </span><span class="pyg-o">==</span><span class="pyg-"> </span><span class="pyg-s">&quot;__main__&quot;</span><span class="pyg-p">:</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L94" href="#L94">94</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;&lt;empty&gt; -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L95" href="#L95">95</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;sys.get -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;sys.get&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L96" href="#L96">96</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;sy -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;sy&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L97" href="#L97">97</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;sy (sys in context) -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;sy&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-o">=</span><span class="pyg-p">[</span><span class="pyg-s">&quot;import sys&quot;</span><span class="pyg-p">])</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L98" href="#L98">98</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;foo. -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;foo.&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L99" href="#L99">99</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;Enc (email * imported) -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L100" href="#L100">100</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;Enc&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-o">=</span><span class="pyg-p">[</span><span class="pyg-s">&quot;from email import *&quot;</span><span class="pyg-p">])</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L101" href="#L101">101</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;E (email * imported) -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L102" href="#L102">102</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;E&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">imports</span><span class="pyg-o">=</span><span class="pyg-p">[</span><span class="pyg-s">&quot;from email import *&quot;</span><span class="pyg-p">])</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L103" href="#L103">103</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L104" href="#L104">104</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;Enc -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;Enc&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L105" href="#L105">105</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-">    </span><span class="pyg-k">print</span><span class="pyg-"> </span><span class="pyg-s">&quot;E -&gt;&quot;</span><span class="pyg-p">,</span><span class="pyg-"> </span><span class="pyg-n">pycomplete</span><span class="pyg-p">(</span><span class="pyg-s">&quot;E&quot;</span><span class="pyg-p">)</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L106" href="#L106">106</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L107" href="#L107">107</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># Local Variables :</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L108" href="#L108">108</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># pymacs-auto-reload : t</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L109" href="#L109">109</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre><span class="pyg-c"># End :</span><span class="pyg-"></span></pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L110" href="#L110">110</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre></pre></td>
</tr>
</table>
</div>
</div>
<p class="fl">Loggerhead is a web-based interface for <a href="http://bazaar-vcs.org/">Bazaar</a> branches</p>
</div>
</body>
</html>