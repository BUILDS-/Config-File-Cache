require "fileinto";
require "imapflags";

# blueberry-meringue logs
if anyof(address :is :all "from" "logcheck@blueberry-meringue.mit.edu",
	 address :is :all "from" "root@blueberry-meringue.mit.edu")
{
  fileinto "INBOX.Personal.Logs";
}

# robots
elsif address :matches ["to", "cc", "bcc", "from"] "robots*@media.mit.edu"
{
  addflag "\\Seen";
  fileinto "INBOX.Archives.2010";
}

# Banking
elsif address :matches "from" "bankofamerica.com$"
{
  fileinto "INBOX.Personal.Banking";
}

# reuse
elsif address :is ["to", "cc", "bcc", "from"] "reuse@mit.edu"
{
  addflag "\\Seen";
  fileinto "INBOX.Misc.Reuse";
}

# spam quarantine
elsif address :is "from" "SpamQuarantine@MIT.EDU"
{
  addflag "\\Seen";
  fileinto "INBOX.Misc.Spam Quarantine Summaries";
}

# debathena
elsif anyof(address :is ["to", "cc", "bcc", "from"] "debathena@mit.edu",
	    address :is ["to", "cc", "bcc", "from"] "source-commits@mit.edu")
{
  fileinto "INBOX.SIPB.Debathena";
}

# linerva
elsif anyof(address :is "from" "logcheck@dr-wily.mit.edu",
	    address :is "from" "root@dr-wily.mit.edu",
	    address :is ["from", "to", "cc", "bcc"] "linerva@mit.edu")
{
  fileinto "INBOX.SIPB.Linerva";
}

# pika
elsif anyof(address :matches ["from", "to", "cc", "bcc"] "pika*@*mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "summer-pikans@*mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "yfnh*@*mit.edu")
{
  fileinto "INBOX.pika";
}

# SIPB
elsif address :matches ["from", "to", "cc", "bcc"] "sipb*@mit.edu"
{
  fileinto "INBOX.SIPB";
}

# gutenbach
elsif address :matches ["from", "to", "cc", "bcc"] "gutenbach*@mit.edu"
{
  fileinto "INBOX.SIPB.Gutenbach";
}

# mitex
elsif address :matches ["from", "to", "cc", "bcc"] "mitex@mit.edu"
{
  fileinto "INBOX.SIPB.MITeX";
}

# fireflyblink
elsif address :matches ["from", "to", "cc", "bcc"] "fireflyblink@fireflyartscollective.org"
{
  fileinto "INBOX.Misc.Fireflyblink";
}

# csail-related
elsif anyof(address :matches ["from", "to", "cc", "bcc"] "csail-related@lists.csail.mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "csail-related@csail.mit.edu")
{
  fileinto "INBOX.Misc.csail-related";
}

# work
elsif anyof(address :matches ["from", "to", "cc", "bcc"] "cocosci@mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "cocosci-lab@mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "pbatt@mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "jbt@mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "torralba@mit.edu",
	    address :matches ["from", "to", "cc", "bcc"] "wingated@mit.edu")
{
  fileinto "INBOX.Work";
}
