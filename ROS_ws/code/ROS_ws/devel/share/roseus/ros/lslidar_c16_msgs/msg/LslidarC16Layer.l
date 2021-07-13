;; Auto-generated. Do not edit!


(when (boundp 'lslidar_c16_msgs::LslidarC16Layer)
  (if (not (find-package "LSLIDAR_C16_MSGS"))
    (make-package "LSLIDAR_C16_MSGS"))
  (shadow 'LslidarC16Layer (find-package "LSLIDAR_C16_MSGS")))
(unless (find-package "LSLIDAR_C16_MSGS::LSLIDARC16LAYER")
  (make-package "LSLIDAR_C16_MSGS::LSLIDARC16LAYER"))

(in-package "ROS")
;;//! \htmlinclude LslidarC16Layer.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass lslidar_c16_msgs::LslidarC16Layer
  :super ros::object
  :slots (_scan_channel ))

(defmethod lslidar_c16_msgs::LslidarC16Layer
  (:init
   (&key
    ((:scan_channel __scan_channel) (let (r) (dotimes (i 16) (push (instance sensor_msgs::LaserScan :init) r)) r))
    )
   (send-super :init)
   (setq _scan_channel __scan_channel)
   self)
  (:scan_channel
   (&rest __scan_channel)
   (if (keywordp (car __scan_channel))
       (send* _scan_channel __scan_channel)
     (progn
       (if __scan_channel (setq _scan_channel (car __scan_channel)))
       _scan_channel)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/LaserScan[16] _scan_channel
    (apply #'+ (send-all _scan_channel :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/LaserScan[16] _scan_channel
     (dolist (elem _scan_channel)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/LaserScan[16] _scan_channel
   (dotimes (i 16)
     (send (elt _scan_channel i) :deserialize buf ptr-) (incf ptr- (send (elt _scan_channel i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get lslidar_c16_msgs::LslidarC16Layer :md5sum-) "68a91988942756cb30282e7a5cad7fbd")
(setf (get lslidar_c16_msgs::LslidarC16Layer :datatype-) "lslidar_c16_msgs/LslidarC16Layer")
(setf (get lslidar_c16_msgs::LslidarC16Layer :definition-)
      "# Header header
# The 0th scan is at the bottom
sensor_msgs/LaserScan[16] scan_channel
================================================================================
MSG: sensor_msgs/LaserScan
# Single scan from a planar laser range-finder
#
# If you have another ranging device with different behavior (e.g. a sonar
# array), please find or create a different message, since applications
# will make fairly laser-specific assumptions about this data

Header header            # timestamp in the header is the acquisition time of 
                         # the first ray in the scan.
                         #
                         # in frame frame_id, angles are measured around 
                         # the positive Z axis (counterclockwise, if Z is up)
                         # with zero angle being forward along the x axis
                         
float32 angle_min        # start angle of the scan [rad]
float32 angle_max        # end angle of the scan [rad]
float32 angle_increment  # angular distance between measurements [rad]

float32 time_increment   # time between measurements [seconds] - if your scanner
                         # is moving, this will be used in interpolating position
                         # of 3d points
float32 scan_time        # time between scans [seconds]

float32 range_min        # minimum range value [m]
float32 range_max        # maximum range value [m]

float32[] ranges         # range data [m] (Note: values < range_min or > range_max should be discarded)
float32[] intensities    # intensity data [device-specific units].  If your
                         # device does not provide intensities, please leave
                         # the array empty.

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

")



(provide :lslidar_c16_msgs/LslidarC16Layer "68a91988942756cb30282e7a5cad7fbd")


