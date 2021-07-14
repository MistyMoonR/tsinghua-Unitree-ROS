/****************************************************************/
/*                                                              */
/*          Advanced Navigation Packet Protocol Library         */
/*          .NET C# Language Spatial SDK, Version 4.0           */
/*   Copyright 2014, Xavier Orr, Advanced Navigation Pty Ltd    */
/*                                                              */
/****************************************************************/
/*
 * Copyright (C) 2014 Advanced Navigation Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
 
namespace ANPPExample
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.comboPort = new System.Windows.Forms.ComboBox();
            this.comboBaud = new System.Windows.Forms.ComboBox();
            this.buttonConnect = new System.Windows.Forms.Button();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.textBoxYaw = new System.Windows.Forms.TextBox();
            this.textBoxPitch = new System.Windows.Forms.TextBox();
            this.textBoxRoll = new System.Windows.Forms.TextBox();
            this.textBoxHeight = new System.Windows.Forms.TextBox();
            this.textBoxLongitude = new System.Windows.Forms.TextBox();
            this.textBoxLatitude = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // serialPort1
            // 
            this.serialPort1.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort1_DataReceived);
            // 
            // comboPort
            // 
            this.comboPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboPort.FormattingEnabled = true;
            this.comboPort.Location = new System.Drawing.Point(13, 13);
            this.comboPort.Name = "comboPort";
            this.comboPort.Size = new System.Drawing.Size(121, 21);
            this.comboPort.TabIndex = 0;
            // 
            // comboBaud
            // 
            this.comboBaud.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBaud.FormattingEnabled = true;
            this.comboBaud.Items.AddRange(new object[] {
            "1200",
            "2400",
            "4800",
            "9600",
            "19200",
            "38400",
            "57600",
            "115200",
            "230400",
            "460800",
            "500000",
            "921600",
            "1000000"});
            this.comboBaud.Location = new System.Drawing.Point(141, 13);
            this.comboBaud.Name = "comboBaud";
            this.comboBaud.Size = new System.Drawing.Size(121, 21);
            this.comboBaud.TabIndex = 1;
            // 
            // buttonConnect
            // 
            this.buttonConnect.Location = new System.Drawing.Point(269, 13);
            this.buttonConnect.Name = "buttonConnect";
            this.buttonConnect.Size = new System.Drawing.Size(75, 23);
            this.buttonConnect.TabIndex = 2;
            this.buttonConnect.Text = "Connect";
            this.buttonConnect.UseVisualStyleBackColor = true;
            this.buttonConnect.Click += new System.EventHandler(this.buttonConnect_Click);
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textBoxYaw);
            this.groupBox1.Controls.Add(this.textBoxPitch);
            this.groupBox1.Controls.Add(this.textBoxRoll);
            this.groupBox1.Controls.Add(this.textBoxHeight);
            this.groupBox1.Controls.Add(this.textBoxLongitude);
            this.groupBox1.Controls.Add(this.textBoxLatitude);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 40);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(332, 112);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Data";
            // 
            // textBoxYaw
            // 
            this.textBoxYaw.Location = new System.Drawing.Point(226, 71);
            this.textBoxYaw.Name = "textBoxYaw";
            this.textBoxYaw.ReadOnly = true;
            this.textBoxYaw.Size = new System.Drawing.Size(100, 20);
            this.textBoxYaw.TabIndex = 11;
            // 
            // textBoxPitch
            // 
            this.textBoxPitch.Location = new System.Drawing.Point(226, 45);
            this.textBoxPitch.Name = "textBoxPitch";
            this.textBoxPitch.ReadOnly = true;
            this.textBoxPitch.Size = new System.Drawing.Size(100, 20);
            this.textBoxPitch.TabIndex = 10;
            // 
            // textBoxRoll
            // 
            this.textBoxRoll.Location = new System.Drawing.Point(226, 19);
            this.textBoxRoll.Name = "textBoxRoll";
            this.textBoxRoll.ReadOnly = true;
            this.textBoxRoll.Size = new System.Drawing.Size(100, 20);
            this.textBoxRoll.TabIndex = 9;
            // 
            // textBoxHeight
            // 
            this.textBoxHeight.Location = new System.Drawing.Point(69, 71);
            this.textBoxHeight.Name = "textBoxHeight";
            this.textBoxHeight.ReadOnly = true;
            this.textBoxHeight.Size = new System.Drawing.Size(100, 20);
            this.textBoxHeight.TabIndex = 8;
            // 
            // textBoxLongitude
            // 
            this.textBoxLongitude.Location = new System.Drawing.Point(69, 45);
            this.textBoxLongitude.Name = "textBoxLongitude";
            this.textBoxLongitude.ReadOnly = true;
            this.textBoxLongitude.Size = new System.Drawing.Size(100, 20);
            this.textBoxLongitude.TabIndex = 7;
            // 
            // textBoxLatitude
            // 
            this.textBoxLatitude.Location = new System.Drawing.Point(69, 19);
            this.textBoxLatitude.Name = "textBoxLatitude";
            this.textBoxLatitude.ReadOnly = true;
            this.textBoxLatitude.Size = new System.Drawing.Size(100, 20);
            this.textBoxLatitude.TabIndex = 6;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(186, 74);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(31, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "Yaw:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(186, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(34, 13);
            this.label5.TabIndex = 4;
            this.label5.Text = "Pitch:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(186, 22);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(28, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "Roll:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(41, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Height:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Longitude:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Latitude:";
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(12, 158);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.ReadOnly = true;
            this.richTextBox1.Size = new System.Drawing.Size(332, 280);
            this.richTextBox1.TabIndex = 4;
            this.richTextBox1.Text = "";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(359, 450);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.buttonConnect);
            this.Controls.Add(this.comboBaud);
            this.Controls.Add(this.comboPort);
            this.Name = "Form1";
            this.Text = "ANPP Example";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.IO.Ports.SerialPort serialPort1;
        private System.Windows.Forms.ComboBox comboPort;
        private System.Windows.Forms.ComboBox comboBaud;
        private System.Windows.Forms.Button buttonConnect;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox textBoxYaw;
        private System.Windows.Forms.TextBox textBoxPitch;
        private System.Windows.Forms.TextBox textBoxRoll;
        private System.Windows.Forms.TextBox textBoxHeight;
        private System.Windows.Forms.TextBox textBoxLongitude;
        private System.Windows.Forms.TextBox textBoxLatitude;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RichTextBox richTextBox1;
    }
}

