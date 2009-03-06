;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; A sample file of .mew.el
;;;
;
; This is just a sample. You should customize as you like...
;

(setq mew-name "Takuya Murakami") ;; (user-full-name)
(setq mew-user "murakami") ;; (user-login-name)
(setq mew-mail-domain "da.jp.nec.com")

;; For SMTP
(setq mew-smtp-server "mail.jp.nec.com")  ;; if not localhost
(setq mew-smtp-user "murakami@da.jp.nec.com")

;; For POP
;; (setq mew-pop-user "your POP account")  ;; (user-login-name)
;(setq mew-pop-server "your POP server")    ;; if not localhost

;; To use local mailbox "mbox" or "maildir" instead of POP
;(setq mew-mailbox-type 'mbox)
;(setq mew-mbox-command "incm")
;(setq mew-mbox-command-arg "-u -d /home/tmurakam/Maildir")
;; If /path/to/mbox is a file, it means "mbox".
;; If /path/to/mbox is a directory, it means "maildir".

;; For IMAP
(setq mew-proto "%")
(setq mew-imap-user "tmurakam")  ;; (user-login-name)
;(setq mew-imap-server "your IMAP server")    ;; if not localhost

;; For NNTP
;; (setq mew-nntp-user "your NNTP account")
;(setq mew-nntp-server "your NNTP server")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Window tips
;;;

;; If you use XEmacs and your video chip provides only limited
;; color map(e.g. 256), put the following line to avoid exhaustion
;; of colors.
;(setq mew-demo-picture nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Citation tip
;;;
;;;
;;; From: Kazu-kun
;;; Subject: Hello World
;;; Date: Thu, 08 Dec 1994 11:44:08 +0900
;;; Message-Id: <199509291309.WAA21663@decpc07.aist-nara.ac.jp>
;;;
;;; Kazu-kun> The quick brown fox jumped over the very lazy dog.
;;;

(setq mew-cite-fields '("From:" "Subject:" "Date:" "Message-ID:"))
(setq mew-cite-format "From: %s\nSubject: %s\nDate: %s\nMessage-ID: %s\n\n")
(setq mew-cite-prefix-function 'mew-cite-prefix-username)
;(setq mew-addrbook-for-cite-label 'nickname)
;(setq mew-addrbook-for-cite-prefix 'nickname)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Pick macro
;;;

;(mew-pick-define-macro "tocc=#" "to=#|cc=#")
;(mew-pick-define-macro "mew" "tocc=mew")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; C-u ? and M-n
;;;

;; To whose who want to search Japanese key in the entire of messages.
;; ftp://ftp.iij.ad.jp/pub/IIJ/dist/utashiro/perl/mg-xxx
;; ftp://ftp.iij.ad.jp/pub/IIJ/dist/utashiro/perl/jcode-xxx.pl
;;
;; (setq mew-prog-grep "mg")
;;
;; 1. Search an EUC key (after converting to JIS) on JIS messages.
;; (setq mew-prog-grep-opts '("-j" "jis" "-l" "-e"))
;;
;; 2. Search an EUC key (after converting to JIS) on JIS messages
;;    decoding their encoded-words.
;; (setq mew-prog-grep-opts '("-j" "jis" "-l" "-e" "-x" "&mime"))
;;
;; 3. Search an EUC key on JIS messages after converting to EUC by nkf.
;; (setq mew-prog-grep-opts '("-l" "-e" "-z" "nkf -e"))
;;
;; 4. Search an EUC key on JIS messages after converting to EUC
;;    and decoding their encoded-words by nkf. Make sure that
;;    "nkf" has the "-m" option.
;; (setq mew-prog-grep-opts '("-l" "-e" "-z" "nkf -e -m"))
;;
;; Set mew-prog-vgrep and mew-prog-vgrep-opts also.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using "Mozilla"
;;;

;(setq mew-prog-text/html-ext "mozilla")

;(define-key mew-message-mode-map [mouse-2] 'browse-url-at-mouse)
;(setq browse-url-netscape-program "mozilla")
;(setq thing-at-point-url-path-regexp "[/A-Za-z0-9---_.${}#%,:?=&~]+")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using "w3m" with "emacs-w3m"
;;;
;;; w3m: please use w3m-m17n based on m3m 0.2.5 (or greater maybe).
;;;	http://www2u.biglobe.ne.jp/~hsaka/w3m/
;;;
;;; emacs-w3m:
;;;     cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot login
;;;     cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m


;(setq mew-mime-multipart-alternative-list '("Text/Html" "Text/Plain" "*."))

;(condition-case nil
;    (require 'mew-w3m)
;  (file-error nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using "wvHtml", "xlhtml", and "ppthtml"
;;;
;;; Unicode is necessary. Emacs 21.3.50 or later includes Unicode by 
;;; default. For earlier versions, install Mule-UCS.
;;;
;;;     ftp://ftp.m17n.org/pub/mule/Mule-UCS/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using "wvHtml"
;;;	http://www.wvware.com/
;;;
;;; The default configuration is for the version greater than 
;;; or equal to 0.7. For the version prior to 0.7, set as follows:

;(setq mew-use-old-wvhtml t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using "xlhtml" and "ppthtml"
;;;	http://chicago.sourceforge.net/xlhtml/
;;;
;;; The default configuration is for the version greater than 
;;; or equal to 0.3. For the version prior to 0.3, set as follows:

;(setq mew-prog-application/msexcel "xlHtml")
;(setq mew-prog-application/mspowerpoint "pptHtml")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using OpenOffice.org (openoffice)
;;;

;(setq mew-prog-msword '("openoffice" nil t))
;(setq mew-prog-msexcel '("openoffice" nil t))
;(setq mew-prog-mspowerpoint '("openoffice" nil t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Using StarSuite (soffice)
;;;

;(setq mew-prog-msword '("soffice" nil t))
;(setq mew-prog-msexcel '("soffice" nil t))
;(setq mew-prog-mspowerpoint '("soffice" nil t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Replying messages and character set
;;;

;; When replying, select input method according to the character set 
;; of the message to be replied.

;(setq mew-charset-input-method-alist
;      '(("iso-8859-1"  . "latin-1-postfix")
;	("iso-8859-2"  . "latin-2-postfix")
;	("iso-8859-15" . "latin-9-postfix")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Printing Message mode to your PS printer
;;;

;(setq mew-print-function 'ps-print-buffer)
;(setq ps-multibyte-buffer 'non-latin-printer) ;; for Japanese
;(setq ps-print-header nil)

;;
;; remember password
(setq mew-use-cached-passwd t)

;;;
;;; End
;;;
