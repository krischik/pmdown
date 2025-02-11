"-------------------------------------------------------------------------------
"  Description: Convert PMWiki to Markdown
"   Maintainer: Martin Krischik «krischik@users.sourceforge.net»
"       Author: Martin Krischik «krischik@users.sourceforge.net»
"    Copyright: Copyright © 2023 Martin Krischik
" Name Of File: plugin/pm2md.vim
"      Version: 1.1
"	 Usage: copy to plugin directory
"      History: 18.10.2023 MK Initial Release
"      History: 29.10.2023 MK Update Extract_Text to get initial and update
"			      timestamps.
"-------------------------------------------------------------------------------

command		PMWikiExtractText	    :call pm2md#Extract_Text()
command		PMWikiAddFrontMatter	    :call pm2md#Add_Front_Matter()
command		PMWikiConvert		    :call pm2md#Convert()
command		PMWikiConvertTable	    :call pm2md#Convert_Table()
command -range	PMWikiConvertSimpleTable    :<line1>,<line2> call pm2md#Convert_Simple_Table()
command		PMWikiConvertComplexTable   :call pm2md#Convert_Complex_Table()

execute "50menu Plugin.Wiki.PMWiki\\ Extract\\ Text"		. " :call pm2md#Extract_Text()<CR>"
execute "50menu Plugin.Wiki.PMWiki\\ Add\\ Front\\ Matter"	. " :call pm2md#Add_Front_Matter()<CR>"
execute "50menu Plugin.Wiki.PMWiki\\ Convert"			. " :call pm2md#Convert()<CR>"
execute "50menu Plugin.Wiki.PMWiki\\ Convert\\ Table"		. " :call pm2md#Convert_Table()<CR>"
execute "50menu Plugin.Wiki.PMWiki\\ Convert\\ Simple\\ Table"	. " :'<,'>call pm2md#Convert_Simple_Table()<CR>"
execute "50menu Plugin.Wiki.PMWiki\\ Convert\\ Complex\\ Table"	. " :'<,'>call pm2md#Convert_Complex_Table()<CR>"

nmap <F12>tc  :1,10 substitute /^\(date\s*: \).*$/\= submatch(1)    . strftime("%Y-%m-%dT%T%z",expand("%")->getftime()) /<CR>
nmap <F12>tm  :1,10 substitute /^\(lastmod\s*: \).*$/\= submatch(1) . strftime("%Y-%m-%dT%T%z",expand("%")->getftime()) /<CR>
imap <F12>t  <C-R>=strftime("%Y-%m-%dT%T%z",expand("%")->getftime())<CR>

" vim: set textwidth=78 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
" vim: set filetype=vim fileencoding= fileformat=unix foldmethod=marker :
" vim: set nospell spelllang=en_bg :
