;; Auto-generated. Do not edit!


(when (boundp 'lslidar_c16_msgs::LslidarC16ScanUnified)
  (if (not (find-package "LSLIDAR_C16_MSGS"))
    (make-package "LSLIDAR_C16_MSGS"))
  (shadow 'LslidarC16ScanUnified (find-package "LSLIDAR_C16_MSGS")))
(unless (find-package "LSLIDAR_C16_MSGS::LSLIDARC16SCANUNIFIED")
  (make-package "LSLIDAR_C16_MSGS::LSLIDARC16SCANUNIFIED"))

(in-package "ROS")
;;//! \htmlinclude LslidarC16ScanUnified.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass lslidar_c16_msgs::LslidarC16ScanUnified
  :super ros::object
  :slots (_header _basetime _packets ))

(defmethod lslidar_c16_msgs::LslidarC16ScanUnified
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:basetime __basetime) 0)
    ((:packets __packets) (let (r) (dotimes (i 0) (push (instance lslidar_c16_msgs::LslidarC16Packet :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _basetime (round __basetime))
   (setq _packets __packets)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:basetime
   (&optional __basetime)
   (if __basetime (setq _basetime __basetime)) _basetime)
  (:packets
   (&rest __packets)
   (if (keywordp (car __packets))
       (send* _packets __packets)
     (progn
       (if __packets (setq _packets (car __packets)))
       _packets)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint64 _basetime
    8
    ;; lslidar_c16_msgs/LslidarC16Packet[] _packets
    (apply #'+ (send-all _packets :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint64 _basetime
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _basetime (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _basetime) (= (length (_basetime . bv)) 2)) ;; bignum
              (write-long (ash (elt (_basetime . bv) 0) 0) s)
              (write-long (ash (elt (_basetime . bv) 1) -1) s))
             ((and (class _basetime) (= (length (_basetime . bv)) 1)) ;; big1
              (write-long (elt (_basetime . bv) 0) s)
              (write-long (if (>= _basetime 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _basetime s)(write-long (if (>= _basetime 0) 0 #xffffffff) s)))
     ;; lslidar_c16_msgs/LslidarC16Packet[] _packets
     (write-long (length _packets) s)
     (dolist (elem _packets)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint64 _basetime
     
#+(or :alpha :irix6 :x86_64)
      (setf _basetime (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _basetime (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; lslidar_c16_msgs/LslidarC16Packet[] _packets
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _packets (let (r) (dotimes (i n) (push (instance lslidar_c16_msgs::LslidarC16Packet :init) r)) r))
     (dolist (elem- _packets)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get lslidar_c16_msgs::LslidarC16ScanUnified :md5sum-) "a02f26cda99b9e0189aac08ed1065a71")
(setf (get lslidar_c16_msgs::LslidarC16ScanUnified :datatype-) "lslidar_c16_msgs/LslidarC16ScanUnified")
(setf (get lslidar_c16_msgs::LslidarC16ScanUnified :definition-)
      "#lslidar C16 scan packets

Header           header         #standard ros message header
uint64           basetime       #time to the top of hour
LslidarC16Packet[] packets        #vector of raw packets

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: lslidar_c16_msgs/LslidarC16Packet
# Raw Leishen LIDAR packet.

time stamp              # packet timestamp
uint8[1206] data        # packet contents


")



(provide :lslidar_c16_msgs/LslidarC16ScanUnified "a02f26cda99b9e0189aac08ed1065a71")


