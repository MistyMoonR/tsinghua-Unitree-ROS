
(cl:in-package :asdf)

(defsystem "lslidar_c16_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "LslidarC16Layer" :depends-on ("_package_LslidarC16Layer"))
    (:file "_package_LslidarC16Layer" :depends-on ("_package"))
    (:file "LslidarC16Packet" :depends-on ("_package_LslidarC16Packet"))
    (:file "_package_LslidarC16Packet" :depends-on ("_package"))
    (:file "LslidarC16Point" :depends-on ("_package_LslidarC16Point"))
    (:file "_package_LslidarC16Point" :depends-on ("_package"))
    (:file "LslidarC16Scan" :depends-on ("_package_LslidarC16Scan"))
    (:file "_package_LslidarC16Scan" :depends-on ("_package"))
    (:file "LslidarC16ScanUnified" :depends-on ("_package_LslidarC16ScanUnified"))
    (:file "_package_LslidarC16ScanUnified" :depends-on ("_package"))
    (:file "LslidarC16Sweep" :depends-on ("_package_LslidarC16Sweep"))
    (:file "_package_LslidarC16Sweep" :depends-on ("_package"))
  ))