;;; elmpd-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "elmpd" "elmpd.el" (0 0 0 0))
;;; Generated autoloads from elmpd.el

(autoload 'elmpd-connect "elmpd" "\
Connect to an MPD server according to ARGS.  Return an `elmpd-connection'.

ARGS shall be in the form of keyword arguments.  The keywords may
be any of the following:

          :name The name by which to refer to the underlying
                socket (AKA network process); it will be modified
                as necessary to make it unique; defaults to
                \"*elmpd-connection*\"

          :host The host on which the MPD server resides;
                defaults first to the environment variable
                \"MPD_HOST\", then to \"localhost\"

          :port The port on which MPD is listening; defaults
                first to the environment variable \"MPD_PORT\",
                then to 6600

         :local Path to the Unix socket on which MPD is
                listening; mutually exclusive with :host & :port;
                this option is preferred, so to force a TCP
                connection, pass this explicitly as nil

      :password If given, the \"password\" command shall be
                issued after the initial connection is made; this
                should only be done over an encrypted connection,
                such as port forwarding over SSH

    :subsystems If given, this connection will perpetually idle;
                whenever a command is issued on this connection,
                a \"noidle\" command shall be given, followed by
                the command.  When that command completes,
                \"idle\" will be re-issued.  This argument shall
                be a cons cell whose car is either the keyword
                'all, the symbol representing the subsystem of
                interest, or a list of symbols naming the
                subsystems of interest (e.g. '(player mixer
                output) and whose cdr is a callback to be invoked
                when any of those subsystems change; the callback
                shall take two parameters the first of which will
                be the `elmpd-connection' which saw the state
                change & the second of which will be either a
                single symbol or a list of symbols naming the
                changed subsystems

The connection object will still be in the process of
construction on return; we need to collect the greeting & parse
the protocol version, we may need to send the \"password\"
command & we may need to send the \"idle\" command, if requested.
This is all handled asynchronously; the caller is free to send
commands through the connection & they will be queued up & sent
as soon as possible.

\(fn &rest ARGS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elmpd" '("elmpd-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elmpd-autoloads.el ends here
