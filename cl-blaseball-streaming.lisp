(defpackage :cl-blaseball-streaming
  (:use :cl)
  (:nicknames :blaseball-live)
  (:export :blaseball-websocket))

(in-package :cl-blaseball-streaming)

(defun print-open ()
  (format t "Connected!"))

(defun print-close (&key code reason)
  (when (and code reason)
    (format t "Connection Terminated.~%Reason: ~a (code=~a)" reason code)))

(defun blaseball-websocket (process-fn &key (open-fn #'print-open) (close-fn #'print-close))
  "opens a streaming connection to blaseball, live!

PROCESS-FN is a function to parse and process the incoming json data"
  (let ((websocket (wsd:make-client "wss://blaseball.com/socket.io/?EIO3&transport=websocket")))
    (wsd:remove-all-listeners websocket)
    (wsd:on :open websocket open-fn)
    (wsd:on :message websocket process-fn)
    (wsd:on :close websocket close-fn)
    websocket))
