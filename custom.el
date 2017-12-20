(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-group-matches nil)
 '(alert-default-style (quote notifications))
 '(amd-rename-function (quote ido-write-file))
 '(amd-use-relative-file-name t)
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#da8548" "#61afef" "#c678dd" "#1f5582" "#abb2bf"])
 '(aw-keys (quote (116 110 115 101 114 105 97 111 100)))
 '(battery-mode-line-limit 99)
 '(buffer-watcher-commands
   (quote
    (("yomaco less" less-css-mode "/home/nico/work/ftgp/yomaco" "lessc --line-numbers=comments themes/foretagsplatsen/less/foretagsplatsen.less > css/foretagsplatsen.css && blessc css/foretagsplatsen.css -f")
     ("monitor less" less-css-mode "/home/nico/work/ftgp/monitor/monitor/Monitor.Web.Ui/Client" "gulp css")
     ("teamwall less" less-css-mode "/home/nico/work/clojure/teamwall/" "lessc --line-numbers=comments resources/less/page.less > resources/public/css/page.css")
     ("researchr less" less-css-mode "/home/nico/work/aurelia/researchr/" "lessc researchr.less --line-numbers=comments > ../css/researchr.css "))))
 '(company-backends
   (quote
    (company-tern company-elisp company-nxml company-css company-semantic company-clang company-cmake company-capf
		  (company-dabbrev-code company-keywords)
		  company-files company-dabbrev company-slime)))
 '(company-tooltip-align-annotations t)
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("3bc446d93412f440d9e83add5ec5231ca7390e724947d96f7f17498baea64b57" "d0ef31755ffdd424b5362a138cf42a2d215cc614964b8709117df5ab8f6e7386" "c585d7d6cf87aa58df504e5a6cb56cc1ab9b6f122364656b678671d6ba459be7" "5a603291fd17c6e27fa16f644e23091ac40b3802c292e4e8fd6632f3f9c5d0de" "7c8478aeefb397014997d637632ef4a461b6d3ecf97d7f21556a32dc3ca01c8c" "6254372d3ffe543979f21c4a4179cd819b808e5dd0f1787e2a2a647f5759c1d1" "f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" "e12ba1e45e55c1bb4c2727d1d861e94b0e5e93a38524c9e4505ca629269738a4" "3c0b16189528b732fd8c2df750136a1e7c91e39ca3436ce8a560884889981c7d" "dc49e93049497505fa0e598bfdbbb881925aab39c18959276914ce3cc5393af5" "2b3413d25eb98d145a89a07d232392c1843c4b06c0b2dd88edc92d3b17b8c54b" "a0bfc339f674e25c4e6d3de5bcbb69defcea9a317c3e078b19cbd449fa5dd643" "93fdf264bc14b42d0d1d25dacf932f09850e812395400d76d9c67ba18541ce9b" "3f71a51aeaf05fbed9417f775526365a082be0c73cd767893d4ea9248b9c727e" "60e86ddf53bd783630088484ad52ad7b54415e6cd18cb70b3d7d664d107620e6" "2397b7742a06b43b66fa18cca798395c58c54032bd745ab53d599e5b05e36e90" "69f36661fcc25ea1fb8118b713b0f455c2055f550394c55e69dacffafd0351b9" "d5ea615e629835de072d28276d3e1f90c6597a46a34d911c6ca98fea185b17b2" "b264c5ddaf22435b869c10297e8e61bc8eed8d33155291fb9a99496bfed1e46d" "c119521a119d4d074eb2a6fc108c98d9ba8c0c92a654a4faa77984fcee1d9ef4" "2e1b5d2812f8326806583e1070e8cad4b6b80c07ae711ed674b7ba8c74b1c822" "26362c08d84eea3d226e47c1388e7fcaf10e63533c2f81d90cc71a05e901a213" "a5a765a725005ed41ded65a2d6c1a351f2739b76ee79ab1b50fc9946ce2fd0e3" "a83c6f73ba4f936b6d35e282eaa48d44df2e8c5815ca8129d4fd8feb56efb54c" "df3793b492577af397ef629fa6e2484655d6a459da03f82dd6eab5451dbe50da" "65779eead611addecde741618affa85ac8c83d0b45012445e22e18b44767d7bd" "118fd6893e943d079734394bbfbf4f535424c3ecd9e65f7145e2cdb354df1708" "1160f5fc215738551fce39a67b2bcf312ed07ef3568d15d53c87baa4fd1f4d4e" "b0c2d0ff00a6f682e9c2d2b1bed4b7308610fd5fb62cfc5572958667baf8e460" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "26488f9304ea29009b19a3b0a2660932ef748d098cac25a9a4167561c598a86f" "2f15c9d42353f994f694aa25da3a93b8f0d4a99793b687eebdd30e6141b4a818" "a9358dbfe6eb3cc8fc74e92766f949ba5abcc3dea52b38a657fdf21d6b126190" "7c33d91f9896614a9c28e96def4cbd818f0aa7f151d1fb5d205862e86f2a3939" "4b7abf849c4417409eeee5ee008722a7b746e4c564cda1ab6f0aa1ba3da024bf" "4227b41be0c86e46fa037573ed4699fc59637aec01dc23fae89d7d61012417dd" "b93ce589c81df2a0cf7e07d2b84d298105ce0ea189166239915530113d9c07aa" "c93fabc360a4b2adb84cc7ab70a717a990777452ab0328b23812c779ff274154" "34f730eb27cb065a4f1f6e1a33623e3ac0b32604849594fb4865f36322123c0c" "e0ea593de1fb46b2816bc308f964eea9cfa71d16045f383207a7b068fb1c2d5e" "b5106c46bc4e958eff4965a759a72bef9ba59d559f07754a966783b09e80e91b" "052864c65d5fee0f0097ee8acd55d86cf666c214cca9a6f71522499b731ef7b4" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "42f2726b08c278a3e2aa80e9ffb3178586b954b6c476f6cb5c0e817b048b55e6" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8855d6dbd8b4ea5d87146dc77ba1b8b7f06142ee8107429f0520c38777d9b39e" "3737a09fbb3de147a5fbe08dfd3cd47e1c8b16282c805e4cf8ad04077c105ad1" "22a8040977c0b761c71e5f7c68747285eb856f61ac9f2fc8a0b3619e9bcce904" "2ef75a0b64c58767376c9e2c5f07027add146720e6fab6b196cb6a1c68ef3c3f" "fec37b42eef6bacbe5c89d243fd7ed2216b2c81ffcf220ea687879a7fae2bd16" "d06640625bb1d92f29bb226863715fe5609264db807a1c465f55a368f5f97541" "7e83d0aacca4c0e4e9441f920a66ee4de73decc1bb9dd7fcc2c1857948e604c8" "ad86686d808c718244a9a43e073eb520f5304bef8d4969269d7efe873b05272b" "0ac03c1f508afad83392f0e3c2b224e406158c73dfef006461986779c73a454a" "b8b5c353e73470377f2111fddb0ea652d35ce98e0a27a5c592d2ab9f66855106" "34244c75614f772194df889ce22027ae2361bbf6b913d3be8524403c49550db1" "2bed8550c6f0a5ce635373176d5f0e079fb4fb5919005bfa743c71b5eed29d81" "74f047b2bba8a31171d89882b0f7f3d2f56fb6f4fe19f895681ac365ce28eb17" "536e17ea1ffa83e6a5ba0826c58c860f3cce91cd6b2dcda6eb6e3d3423325a40" "2edd2d4f9ded893da7a47d372567925748f26a0c6e4b0175dc73cea53ecc24fe" "fdd33a1dc025b4506ac0f8a86dd1a539abf26546e65040eec08b75dca31ae6c1" "537169a46d87ce1db8b45e9a945cca27b1229ff00b0a299501a722653eb76514" "222fd5af6dff7038093236f5129b225097616af538b2180d6540099e59dd310b" "20ecc512c92408a3f5b4072e9ecc4c3e94b494dbd5b293f200d67c017005090b" "e4dc40f68e6e0211f3bddd4bd7cf4af2b011d4e9680f6310fb3cc742da2eda75" "b84cad7953ebd020ae264464ed800b2265a2752fa3ee165b39f61f42d18331e1" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "90038677570c60e6058e01ca8b7f7a4505c9608528a299c5f163f7ce2165d026" "1ce00f3f8413e448ec635e2e99f572b39a310340a63d1421e8df1b957f966908" "bc249b8e6343d6967f979600a3458793427aa95f22b91931bf391087619d0e29" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "4b38d67a87d09d524072a59f33ea302590d64e17342f0c8a717fc2acc4c7f235" "3af98081c0cf235b7fba9ef7389dde9cfe79ab000fcb0e81735a55003258a7c5" "eea517c5cc867585ba1318d5bb9357b8a5b586e9220f32f35b15124b06d36029" "9c8b6b14235a35f9765b0831b077072fdccb810d33ca70176e5e69e3ce68aefa" "e96d6d21328390f703907d02b8e2a481dd62f466793161376c0c4be48b86d245" "592a64ba45152710af31679b1bcc48774372d3075171f0cb3f6cd34947056277" "feff1f2cd9377c295b4273ece14fe7e7e9c69800eae042c418c9f4e5d7659816" "81a0e1db2a4dcaf69b28b521fd8792563d4ccccc236889834a439a2901fdfd75" "7625bab54bda4fd0c1c5e5629c010e7bb8b715e30d12e3cc32a7dce1685adddc" "a6af2c89fb5af392ef57259d84a54f9d8808a4557608e45ec6e419a30215904b" "d25594db11e666e3d670c739266f62b206814e261e8548becef5258d6cfbd50b" "c9e4bdc479afee1a24ba3ac5c8c1b121dcea1b82a67235b96bf27f57c0eb8b44" "1276b1f168500c302214756a2588d5f8ae646595a57ff3ef178a3b08d4e7fe07" "b67c8e97c68edaaf233b37fb7ed2f6100a2e9e32ee1b440cd6813b0fc64cbf5e" "3aa0ee03445c2f66a481a676105f8af57b3d65f286bce0f5ca2a0a7021f83d17" "6afcf7b1fb0d7999f99805ad97178a894a58f5d1c4f356eb656fbd93b9bdf308" "6d52378b4451194ab953337b87e85ce87bd20e17b5262f44cc93ec4a83fad177" "69a7eaba8be8c7a4b0ccf43e4dcfab5dde22f1eea385dd6197d054b612b088b4" "792d0ff95f6f3a7469b80b32ef9b08d0499dd4c154c7e570d4f5ea102fb459e4" "b8eadfd4416beb2fffc17ca096b99056670f316a6a8998fd7d86c391c67f31d1" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "94e0091d9f9395ee25bb317da1b529ac47a1bcb68d5be5ddf1d2c70daac8351e" "b801e922fb047f81c5025bb0080107b90f73bcfa64ba6d128ede417db4d05553" "297063d0000ca904abb446944398843edaa7ef2c659b7f9087d724bf6f8c1d1f" "d943bd7feb67ac890d05a714fa7ece75c74f368b4b535082cf9889156686006f" "9989a5cd9b772fd4e1d8caf0e24259131d2f77416c127191c25dff3e38e8d2fd" "ae6a698cbbe84614d6dc61f6b1f48545ad4971f8507e27313d44b6bef0f6cf4f" "cd4f9be41a57a36a8707fd8aa5e6fbb5b4629edac9017739ae3c85d0026a8927" "4ba2ecfbcb5717cf726a9b2f17313871c0b558daf190e638f4ccf506e3260c3e" "963c63e6e1b62d4b7b42bb13426e0fb1d6e2b36c32f151d0070753f2efddeeed" "e0d66273dfa183081e2d42453202f5eda5ae7ab175e8eb9df1f3440a92c488e7" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "572caef0c27b100a404db8d540fd5b31397f90ab660ef5539ff0863ff9bee26a" "65385d67a1711d06a04e0cc5830e24ff7d016bdb4f9876a5d538308400024c4c" "0c2ca285c4aedb6d3333e861ccee41edde2afc7efe0f1d347e0133d04f11ab1f" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "f3ceb7a30f6501c1093bc8ffdf755fe5ddff3a85437deebf3ee8d7bed8991711" "f32dd8e7b3a508874eded03d5be43d2bdfffe81c199eea72de06ce3e653db720" "427234e4b45350b4159575f1ac72860c32dce79bb57a29a196b9cfb9dd3554d9" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "5a0522c0959f3b694ffd06ce620ee3868b2da14723c75e76939940971fc84e3b" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(debug-on-error t)
 '(delete-by-moving-to-trash t)
 '(dired-auto-revert-buffer t)
 '(dired-du-size-format t)
 '(dired-guess-shell-alist-user
   (quote
    (("\\.mp4" "totem")
     ("\\.mkv" "totem")
     ("\\.avi" "totem")
     ("\\.html" "nightly")
     ("\\.pdf" "evince")
     ("\\.svg" "inkscape")
     ("\\.png" "eog" "gimp")
     ("\\.jpg" "eog" "gimp"))))
 '(dired-listing-switches "-alh")
 '(doc-view-continuous t)
 '(doc-view-resolution 200)
 '(elbank-saved-monthly-reports
   (quote
    (("Income statement (by category)" "" category amount
      (date label amount)
      nil)
     ("Expenses by day" "" date date
      (date label category amount)
      t)
     ("Food expenses" "Food" category amount
      (date label amount)
      nil))))
 '(elbank-saved-yearly-reports
   (quote
    (("Loan" "Loan" nil nil
      (date label amount)
      nil)
     ("Balance" "" category amount
      (date label amount)
      nil)
     ("Receivables" "Receivables" nil date
      (date label category amount)
      nil))))
 '(eldoc-echo-area-use-multiline-p nil)
 '(enable-recursive-minibuffers t)
 '(eshell-history-size 1000)
 '(eshell-visual-commands
   (quote
    ("vim" "tail" "htop" "ssh" "vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm")))
 '(fci-rule-color "#073642")
 '(fetch-email-interval 600)
 '(fill-column 80)
 '(flycheck-disabled-checkers (quote (javascript-jshint)))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flyspell-delay 1)
 '(ftgp-atlassian-pass-entry "id.atlassian.com")
 '(gdb-enable-debug t)
 '(ggtags-global-output-format (quote ctags-x))
 '(ggtags-sort-by-nearness t)
 '(global-linum-mode nil)
 '(helm-ag-insert-at-point (quote symbol))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(httpd-port 3333)
 '(ido-vertical-define-keys (quote C-n-C-p-up-down-left-right))
 '(imenu-eager-completion-buffer nil)
 '(imenu-use-popup-menu (quote on-mouse))
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines nil)
 '(indium-chrome-executable "chromium-browser")
 '(indium-nodejs-inspect-brk t)
 '(interleave--org-notes-dir-list (quote (".")))
 '(jade-chrome-executable "chromium-browser")
 '(js-switch-indent-offset 4)
 '(js2-global-externs (quote ("define" "require" "app")))
 '(js2-include-node-externs t)
 '(js2-pretty-multiline-declarations nil t)
 '(ledger-clear-whole-transactions t)
 '(ledger-occur-use-face-shown nil)
 '(ledger-post-amount-alignment-at :decimal)
 '(ledger-reconcile-default-commodity "€")
 '(ledger-report-auto-refresh-sticky-cursor t)
 '(ledger-reports
   (quote
    ((#("Vacations" 0 1
	(idx 0))
      "ledger reg -f ledger.dat ^Assets:Vacation")
     (#("prices" 0 1
	(idx 1))
      "ledger -f ledger.dat prices €")
     (#("trading SEK" 0 1
	(idx 2))
      "ledger reg -f ledger.dat trading -X €")
     (#("Forecast" 0 1
	(idx 3))
      "ledger -M -X € -f /home/nico/org/reference/ledger/ledger.dat --forecast \"d<[2017]\" bal ^assets ^liab")
     (#("Budget (with unbudgeted expenses/income)" 0 1
	(idx 4))
      "ledger -p \"this month\" -M -X € -f /home/nico/org/reference/ledger/ledger.dat reg ^expenses ^income --budget --unbudgeted --invert")
     (#("Budget (of the year)" 0 1
	(idx 5))
      "ledger -p \"this year\" -M -X € -f /home/nico/org/reference/ledger/ledger.dat reg ^expenses --budget --invert")
     (#("Budget (last month)" 0 1
	(idx 6))
      "ledger -p \"last month\" -M -X € -f /home/nico/org/reference/ledger/ledger.dat reg ^expenses ^income --budget --invert")
     (#("Budget" 0 1
	(idx 7))
      "ledger -p \"this month\" -M -X € -f /home/nico/org/reference/ledger/ledger.dat reg ^expenses ^income --budget --invert")
     (#("Account statement Swedish Checking" 0 1
	(idx 8))
      "ledger reg -f ledger.dat Assets:Checking:Nordea")
     (#("Account statement Checking" 0 1
	(idx 9))
      "ledger reg -f ledger.dat ^Assets:Checking:CE")
     (#("Income statement (last month)" 0 1
	(idx 10))
      "ledger --invert -S T -f /home/nico/org/reference/ledger/ledger.dat bal ^income ^expenses -X € -p \"last month\"")
     (#("Income statement" 0 1
	(idx 11))
      "ledger --invert -S T -f /home/nico/org/reference/ledger/ledger.dat bal ^income ^expenses -X € -p \"this month\"")
     (#("Cash Flow" 0 1
	(idx 12))
      "ledger reg -f ledger.dat Assets:Swedish Assets:Checking")
     (#("Cash Flow (in €)" 0 1
	(idx 13))
      "ledger reg -f ledger.dat Assets:Swedish Assets:Checking -X €")
     (#("List of accounts" 0 1
	(idx 14))
      "ledger -f /home/nico/org/reference/ledger/ledger.dat accounts")
     (#("Balance sheet" 0 1
	(idx 15))
      "ledger -f /home/nico/org/reference/ledger/ledger.dat bal ^assets ^liabilities ^equity")
     (#("Balance sheet (in euros)" 0 1
	(idx 16))
      "ledger -f /home/nico/org/reference/ledger/ledger.dat bal ^assets ^liabilities ^equity -X €")
     (#("Income statement (all time)" 0 1
	(idx 17))
      "ledger -M --invert -S T -f /home/nico/org/reference/ledger/ledger.dat bal ^income ^expenses -X €")
     (#("Account statement Savings" 0 1
	(idx 18))
      "ledger reg -f ledger.dat ^Assets:Savings")
     (#("Equity" 0 1
	(idx 19))
      "ledger -f ledger.dat equity")
     (#("Cleared" 0 1
	(idx 20))
      "ledger cleared -f ledger.dat"))))
 '(line-spacing nil)
 '(linum-format "%4d ")
 '(locate-ls-subdir-switches "-lhl")
 '(magit-diff-refine-hunk t)
 '(magit-diff-use-overlays nil)
 '(magit-log-section-commit-count 0)
 '(magit-push-always-verify nil)
 '(magit-repo-dirs (quote ("/home/nico/config/" "/home/nico/work/")))
 '(magit-tag-arguments (quote ("--sign")))
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(markdown-command "kramdown")
 '(netstat-program-options (quote ("-auntpx")))
 '(notmuch-address-command nil)
 '(notmuch-crypto-process-mime t)
 '(notmuch-hello-sections
   (quote
    (notmuch-hello-insert-header notmuch-hello-insert-saved-searches notmuch-hello-insert-search notmuch-hello-insert-recent-searches notmuch-hello-insert-alltags notmuch-hello-insert-footer)))
 '(notmuch-mua-reply-insert-header-p-function (quote notmuch-show-reply-insert-header-p-never))
 '(notmuch-saved-searches
   (quote
    ((:name "To me" :query "tag:unread and (to:petton or cc:petton)" :key "m")
     (:name "unread" :query "tag:unread" :key "u")
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "drafts" :query "tag:draft" :key "d")
     (:name "all mail" :query "*" :key "*")
     (:name "Grifon" :query "to:grifon@grifon.fr and tag:unread" :key "g")
     (:name "amber" :query "amber+tag:unread" :key "a")
     (:name "emacs" :query "emacs+tag:unread" :key "e")
     (:name "Debbugs" :query "bug\\# and tag:unread" :key "b")
     (:name "Emacs diffs" :query "[Emacs-diffs] and tag:unread" :key "D")
     (:name "ftgp" :query "(ftgp or foretagsplatsen) and tag:+unread" :key "f")
     (:name "ftgp bugs" :query "from:current@foretagsplatsen.se and tag:unread" :key "F")
     (:name "Logwatch" :query "Logwatch for petton.fr" :key "L" :count-query "logwatch for petton.fr and tag:unread")
     (:name "aurelia" :query "from:aurelia and tag:unread" :key "A")
     (:name "today" :query "date:today..now")
     (:name "week" :query "date:7d..now")
     (:name "sent" :query "from:nicolas petton" :key "s"))))
 '(notmuch-search-oldest-first nil)
 '(notmuch-show-indent-messages-width 1)
 '(notmuch-show-insert-text/plain-hook
   (quote
    (notmuch-wash-convert-inline-patch-to-part notmuch-wash-wrap-long-lines notmuch-wash-tidy-citations notmuch-wash-elide-blank-lines notmuch-wash-excerpt-citations)))
 '(notmuch-show-logo nil)
 '(notmuch-show-part-button-default-action (quote notmuch-show-view-part))
 '(notmuch-tag-formats
   (quote
    (("unread"
      (notmuch-tag-format-image-data tag
				     (notmuch-tag-star-empty-icon))
      (propertize tag
		  (quote face)
		  (quote
		   (:foreground "red"))))
     ("flagged")
     ("encrypted"
      (notmuch-apply-face tag
			  (quote
			   (:weight bold :foreground "orange red")))))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(og-org-agenda-appt-headline "APPT")
 '(org-M-RET-may-split-line (quote ((default))))
 '(org-agenda-custom-commands
   (quote
    (("w" . "TODOs")
     ("d" "30 days deadlines" agenda ""
      ((org-agenda-entry-types
	(quote
	 (:deadline)))
       (org-agenda-overriding-header "Month deadlines")
       (org-agenda-span
	(quote month))
       (org-agenda-overriding-header "")))
     ("l" "Logbook" nico/org-agenda-log ""
      ((org-agenda-overriding-header "Logbook")))
     ("A" "Aurélia" tags-todo "aurelia" nil)
     ("E" "Errands" tags "errands" nil)
     ("n" "Next actions"
      ((alltodo ""
		((org-agenda-tag-filter-preset
		  (quote nil))
		 (org-agenda-overriding-header "Next actions")
		 (org-agenda-skip-function
		  (quote
		   (org-agenda-skip-all-siblings-but-first)))
		 (org-agenda-prefix-format "%-32:(org-agenda-format-parent 30)")
		 (org-agenda-todo-keyword-format "%-4s")
		 (org-agenda-files
		  (quote
		   ("~/org/gtd.org"))))))
      nil nil)
     ("@" "Contexts"
      ((tags "ftgp"
	     ((org-agenda-skip-function
	       (quote
		(org-agenda-skip-all-siblings-but-first)))
	      (org-agenda-overriding-header "FTGP next actions")))
       (tags "emacs"
	     ((org-agenda-overriding-header "Emacs next actions")
	      (org-agenda-skip-function
	       (quote
		(org-agenda-skip-all-siblings-but-first)))))
       (tags-todo "@email"
		  ((org-agenda-overriding-header "Emails")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote nottodo)
		      (quote
		       ("TODO")))))))
       (tags-todo "@phone"
		  ((org-agenda-overriding-header "Phone calls")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-entry-if
		      (quote todo)
		      (quote done))))))
       (todo "WAITING"
	     ((org-agenda-overriding-header "Waiting")))
       (tags-todo "@office"
		  ((org-agenda-skip-function
		    (quote
		     (org-agenda-skip-all-siblings-but-first)))
		   (org-agenda-overriding-header "At the office")))
       (tags-todo "@plourin"
		  ((org-agenda-overriding-header "Plourin")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-all-siblings-but-first)))))
       (tags-todo "@stmartin"
		  ((org-agenda-overriding-header "Saint Martin")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-all-siblings-but-first)))))
       (tags-todo "@brest"
		  ((org-agenda-overriding-header "Brest")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-all-siblings-but-first)))))
       (tags-todo "@stockholm"
		  ((org-agenda-overriding-header "Stockholm")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-all-siblings-but-first)))))
       (tags-todo "@home"
		  ((org-agenda-overriding-header "Home")
		   (org-agenda-skip-function
		    (quote
		     (org-agenda-skip-all-siblings-but-first))))))
      nil nil))))
 '(org-agenda-default-appointment-duration 60)
 '(org-agenda-files
   (quote
    ("~/org/inbox.org" "~/org/agenda.org" "~/org/gtd.org" "~/org/tickler.org")))
 '(org-agenda-log-mode-items (quote (closed clock state)))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-show-future-repeats nil)
 '(org-agenda-span (quote week))
 '(org-clock-clocked-in-display (quote mode-line))
 '(org-clock-in-resume t)
 '(org-clock-mode-line-total (quote today))
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-persist t)
 '(org-columns-default-format "%60ITEM(Task) %10Effort(Estimated Effort){:} %10CLOCKSUM")
 '(org-completion-use-ido t)
 '(org-contacts-files (quote ("~/org/contacts.org")))
 '(org-deadline-warning-days 10)
 '(org-default-notes-file "~/org/inbox.org")
 '(org-ditaa-jar-path "~/bin/ditaa/ditaa.jar")
 '(org-duration-format (quote h:mm))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-taskjuggler-target-version 3)
 '(org-file-apps
   (quote
    (("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     (directory . emacs)
     ("\\.el\\'" . emacs)
     ("\\.org\\'" . emacs))))
 '(org-fontify-done-headline t)
 '(org-global-properties (quote (("Effort_ALL" . "1h 2h 4h 6h 8h 16h"))))
 '(org-gnome-integrate-with-calendar t)
 '(org-gnome-integrate-with-empathy nil)
 '(org-gogs-protocol-base-url "https://petton.fr/git")
 '(org-habit-graph-column 52)
 '(org-hide-leading-stars t)
 '(org-highlight-latex-and-related (quote (latex)))
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-mobile-force-id-on-agenda-items nil)
 '(org-modules
   (quote
    (org-bibtex org-docview org-gnus org-habit org-info org-protocol org-jsinfo org-habit org-irc org-mew org-mhe org-protocol org-rmail org-vm org-wl org-w3m org-bookmark)))
 '(org-pomodoro-audio-player "/usr/bin/afplay")
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-startup-folded (quote showeverything))
 '(org-stuck-projects (quote ("+LEVEL=2/-DONE" ("TODO" "NEXT") nil "")))
 '(org-tags-column -80)
 '(org-tags-exclude-from-inheritance (quote ("project")))
 '(org-time-clocksum-format
   (quote
    (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)")
     (sequence "FEATURE(f)" "|" "COMPLETED(c)")
     (sequence "BUG(b)" "|" "FIXED(x)")
     (sequence "APPT(p)" "|" "DONE(d)" "CANCELLED(a)")
     (sequence "WAITING(w!)" "|" "DONE(d)"))))
 '(pass-show-keybindings nil)
 '(password-cache-expiry 300)
 '(password-store-password-length 25)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(projectile-completion-system (quote ivy))
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((js2-strict-missing-semi-warning)
     (js2-missing-semi-one-line-override)
     (eval ispell-change-dictionary "francais")
     (checkdoc-package-keywords-flag)
     (eval when
	   (and
	    (buffer-file-name)
	    (file-regular-p
	     (buffer-file-name))
	    (string-match-p "^[^.]"
			    (buffer-file-name)))
	   (unless
	       (featurep
		(quote package-build))
	     (let
		 ((load-path
		   (cons "../package-build" load-path)))
	       (require
		(quote package-build))))
	   (package-build-minor-mode)
	   (set
	    (make-local-variable
	     (quote package-build-working-dir))
	    (expand-file-name "../working/"))
	   (set
	    (make-local-variable
	     (quote package-build-archive-dir))
	    (expand-file-name "../packages/"))
	   (set
	    (make-local-variable
	     (quote package-build-recipes-dir))
	    default-directory))
     (jade-workspace-directories "/home/nico/work/ftgp/monitor/monitor/Monitor.Web.Ui/Client")
     (lentic-init . lentic-orgel-org-init)
     (flycheck-javascript-eslint-executable . "/home/nico/work/ftgp/monitor/monitor/Monitor.Web.Ui/Client/node_modules/.bin/eslint")
     (flycheck-eslint-rulesdir . "/home/nico/work/ftgp/monitor/monitor/Monitor.Web.Ui/Client/tools/eslint_rules/")
     (amd-rewrite-rules-alist
      ("^apps/" . ""))
     (ntags-ctags-options . "-Re --exclude='lib/*' --exclude='bower_components/*'")
     (emacs-lisp-docstring-fill-column . 75)
     (eval flycheck-cask-setup)
     (ntags-ctags-options . "-Re --exclude='lib/*' --exclude='css/*' --exclude='bower_components/*' --exclude='bootstrap/*' --exclude='*.html' --exclude='*.php' --exclude='less/*'")
     (require-final-newline . t))))
 '(set-mark-command-repeat-pop t)
 '(show-paren-style (quote parenthesis))
 '(skeletor-completing-read-function (quote completing-read))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#839496" 0.2))
 '(snapshot-timemachine-rsnapshot-backup-dir "/run/media/nico/Backup2")
 '(snapshot-timemachine-rsnapshot-backup-name "lingonberry")
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-scale-org-headlines nil)
 '(solarized-use-variable-pitch nil)
 '(tags-revert-without-query t)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(transmission-refresh-modes
   (quote
    (transmission-mode transmission-files-mode transmission-info-mode transmission-peers-mode)))
 '(transmission-torrent-functions nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(visible-mark-faces (quote (visible-mark-face1 visible-mark-face2)))
 '(visible-mark-max 2)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(winner-boring-buffers (quote ("*Completions* *Messages*")))
 '(winner-mode t)
 '(xref-after-jump-hook (quote (recenter xref-pulse-momentarily)))
 '(xref-prompt-for-identifier
   (quote
    (not xref-find-references xref-find-definitions xref-find-definitions-other-window xref-find-definitions-other-frame)))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"])
 '(yas-global-mode t)
 '(zerodark-use-high-contrast-in-mode-line t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
