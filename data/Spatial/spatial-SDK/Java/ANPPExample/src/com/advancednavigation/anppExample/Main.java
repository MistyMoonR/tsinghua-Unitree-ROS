/****************************************************************/
/*                                                              */
/*      Advanced Navigation Packet Protocol Library             */
/*            Java Language SDK, Version 2.1                    */
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

package com.advancednavigation.anppExample;

import jssc.*;

import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.JComboBox;
import javax.swing.JButton;
import javax.swing.JTextArea;
import javax.swing.DefaultComboBoxModel;
import com.advancednavigation.anPackets.*;

import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Main
{
	private JFrame frmAnppExample;
	private JComboBox<String> comboBoxPort;
	private JComboBox<String> comboBoxBaud;
	private JButton btnConnect;

	// Serial Port
	private SerialPort serialPort;
	protected Boolean serialConnected = false;
	private Boolean serialPortsAvailable = false;
	private JTextArea textArea;
	private JPanel panel;
	private JLabel lblLatitude;
	private JLabel lblLongitude;
	private JLabel lblHeight;
	protected JTextField textFieldLatitude;
	protected JTextField textFieldLongitude;
	protected JTextField textFieldHeight;
	private JLabel lblRoll;
	private JLabel lblPitch;
	private JLabel lblYaw;
	protected JTextField textFieldRoll;
	protected JTextField textFieldPitch;
	protected JTextField textFieldYaw;

	/*
	 * Code for sending packets
	 * 
	 * ANPacket packet = new ANPacket(1, ANPacket.PACKET_ID_REQUEST);
	 * packet.data[0] = ANPacket.PACKET_ID_BOOT_MODE;
	 * serialOutput.write(ANPacketDecoder.packetEncode(packet));
	 * 
	 * The above example sends a packet of length 1 requesting the device boot
	 * mode packet The serial port must be connected for the above code to work,
	 * you can use the boolean serialConnected to check this
	 */

	/**
	 * Launch the application.
	 */
	public static void main(String[] args)
	{
		EventQueue.invokeLater(new Runnable()
		{
			public void run()
			{
				try
				{
					Main window = new Main();
					window.frmAnppExample.setVisible(true);
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Main()
	{
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize()
	{
		// this sets swing to use the native look and feel, much more
		// aesthetically pleasing
		try
		{
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		}
		catch (Exception e)
		{
		}

		// all of the swing components and layout management is best edited
		// using the windowbuilder GUI
		frmAnppExample = new JFrame();
		frmAnppExample.setTitle("ANPP Example");
		frmAnppExample.setBounds(100, 100, 819, 631);
		frmAnppExample.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		GridBagLayout gridBagLayout = new GridBagLayout();
		gridBagLayout.columnWidths = new int[] { 10, 0, 0, 90, 5, 0 };
		gridBagLayout.rowHeights = new int[] { 10, 0, 0, 0, 5, 0 };
		gridBagLayout.columnWeights = new double[] { 0.0, 1.0, 1.0, 0.0, 0.0, Double.MIN_VALUE };
		gridBagLayout.rowWeights = new double[] { 0.0, 0.0, 0.0, 1.0, 0.0, Double.MIN_VALUE };
		frmAnppExample.getContentPane().setLayout(gridBagLayout);

		comboBoxPort = new JComboBox<String>();
		comboBoxPort.setEnabled(false);
		comboBoxPort.setModel(new DefaultComboBoxModel<String>(new String[] { "No Serial Ports" }));
		GridBagConstraints gbc_comboBoxPort = new GridBagConstraints();
		gbc_comboBoxPort.insets = new Insets(0, 0, 5, 5);
		gbc_comboBoxPort.fill = GridBagConstraints.HORIZONTAL;
		gbc_comboBoxPort.gridx = 1;
		gbc_comboBoxPort.gridy = 1;
		frmAnppExample.getContentPane().add(comboBoxPort, gbc_comboBoxPort);

		comboBoxBaud = new JComboBox<String>();
		comboBoxBaud.setModel(new DefaultComboBoxModel<String>(new String[] { "1200", "2400", "4800", "9600", "19200", "38400", "57600", "115200", "230400", "460800", "500000", "921600", "1000000" }));
		comboBoxBaud.setSelectedIndex(7);
		GridBagConstraints gbc_comboBoxBaud = new GridBagConstraints();
		gbc_comboBoxBaud.insets = new Insets(0, 0, 5, 5);
		gbc_comboBoxBaud.fill = GridBagConstraints.HORIZONTAL;
		gbc_comboBoxBaud.gridx = 2;
		gbc_comboBoxBaud.gridy = 1;
		frmAnppExample.getContentPane().add(comboBoxBaud, gbc_comboBoxBaud);

		btnConnect = new JButton("Connect");
		btnConnect.setEnabled(false);
		btnConnect.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent arg0)
			{
				// if the serial port is not connected, this is a connect action
				// if the serial port is connected, this is a disconnect action
				if (!serialConnected)
				{
					try
					{
						serialPort = new SerialPort((String) comboBoxPort.getSelectedItem());
						serialPort.openPort();
						serialPort.setParams(Integer.parseInt((String) comboBoxBaud.getSelectedItem()), SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
						serialPort.setEventsMask(SerialPort.MASK_RXCHAR);

						// add an event listener, which is the subclass at the
						// bottom of this file
						serialPort.addEventListener(new SerialReader());

						// change the button to be disconnect once we are
						// connected
						btnConnect.setText("Disconnect");
						serialConnected = true;
						comboBoxPort.setEnabled(false);
						comboBoxBaud.setEnabled(false);
					}
					catch (Exception exception)
					{
						System.err.println(exception.toString());
						serialPortClose();
					}
				}
				else
				{
					serialPortClose();
				}
			}
		});
		GridBagConstraints gbc_btnConnect = new GridBagConstraints();
		gbc_btnConnect.fill = GridBagConstraints.HORIZONTAL;
		gbc_btnConnect.insets = new Insets(0, 0, 5, 5);
		gbc_btnConnect.gridx = 3;
		gbc_btnConnect.gridy = 1;
		frmAnppExample.getContentPane().add(btnConnect, gbc_btnConnect);

		panel = new JPanel();
		panel.setBorder(new TitledBorder(null, "Data", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		GridBagConstraints gbc_panel = new GridBagConstraints();
		gbc_panel.gridwidth = 3;
		gbc_panel.insets = new Insets(0, 0, 5, 5);
		gbc_panel.fill = GridBagConstraints.BOTH;
		gbc_panel.gridx = 1;
		gbc_panel.gridy = 2;
		frmAnppExample.getContentPane().add(panel, gbc_panel);
		GridBagLayout gbl_panel = new GridBagLayout();
		gbl_panel.columnWidths = new int[] { 10, 0, 0, 5, 0, 5, 0, 0 };
		gbl_panel.rowHeights = new int[] { 5, 0, 0, 0, 5, 0 };
		gbl_panel.columnWeights = new double[] { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Double.MIN_VALUE };
		gbl_panel.rowWeights = new double[] { 0.0, 0.0, 0.0, 0.0, 0.0, Double.MIN_VALUE };
		panel.setLayout(gbl_panel);

		lblLatitude = new JLabel("Latitude:");
		GridBagConstraints gbc_lblLatitude = new GridBagConstraints();
		gbc_lblLatitude.anchor = GridBagConstraints.EAST;
		gbc_lblLatitude.insets = new Insets(0, 0, 5, 5);
		gbc_lblLatitude.gridx = 1;
		gbc_lblLatitude.gridy = 1;
		panel.add(lblLatitude, gbc_lblLatitude);

		textFieldLatitude = new JTextField();
		GridBagConstraints gbc_textFieldLatitude = new GridBagConstraints();
		gbc_textFieldLatitude.insets = new Insets(0, 0, 5, 5);
		gbc_textFieldLatitude.fill = GridBagConstraints.HORIZONTAL;
		gbc_textFieldLatitude.gridx = 2;
		gbc_textFieldLatitude.gridy = 1;
		panel.add(textFieldLatitude, gbc_textFieldLatitude);
		textFieldLatitude.setColumns(15);

		lblRoll = new JLabel("Roll:");
		GridBagConstraints gbc_lblRoll = new GridBagConstraints();
		gbc_lblRoll.anchor = GridBagConstraints.EAST;
		gbc_lblRoll.insets = new Insets(0, 0, 5, 5);
		gbc_lblRoll.gridx = 4;
		gbc_lblRoll.gridy = 1;
		panel.add(lblRoll, gbc_lblRoll);

		textFieldRoll = new JTextField();
		GridBagConstraints gbc_textFieldRoll = new GridBagConstraints();
		gbc_textFieldRoll.insets = new Insets(0, 0, 5, 5);
		gbc_textFieldRoll.fill = GridBagConstraints.HORIZONTAL;
		gbc_textFieldRoll.gridx = 5;
		gbc_textFieldRoll.gridy = 1;
		panel.add(textFieldRoll, gbc_textFieldRoll);
		textFieldRoll.setColumns(15);

		lblLongitude = new JLabel("Longitude:");
		GridBagConstraints gbc_lblLongitude = new GridBagConstraints();
		gbc_lblLongitude.anchor = GridBagConstraints.EAST;
		gbc_lblLongitude.insets = new Insets(0, 0, 5, 5);
		gbc_lblLongitude.gridx = 1;
		gbc_lblLongitude.gridy = 2;
		panel.add(lblLongitude, gbc_lblLongitude);

		textFieldLongitude = new JTextField();
		GridBagConstraints gbc_textFieldLongitude = new GridBagConstraints();
		gbc_textFieldLongitude.insets = new Insets(0, 0, 5, 5);
		gbc_textFieldLongitude.fill = GridBagConstraints.HORIZONTAL;
		gbc_textFieldLongitude.gridx = 2;
		gbc_textFieldLongitude.gridy = 2;
		panel.add(textFieldLongitude, gbc_textFieldLongitude);
		textFieldLongitude.setColumns(15);

		lblPitch = new JLabel("Pitch:");
		GridBagConstraints gbc_lblPitch = new GridBagConstraints();
		gbc_lblPitch.anchor = GridBagConstraints.EAST;
		gbc_lblPitch.insets = new Insets(0, 0, 5, 5);
		gbc_lblPitch.gridx = 4;
		gbc_lblPitch.gridy = 2;
		panel.add(lblPitch, gbc_lblPitch);

		textFieldPitch = new JTextField();
		GridBagConstraints gbc_textFieldPitch = new GridBagConstraints();
		gbc_textFieldPitch.insets = new Insets(0, 0, 5, 5);
		gbc_textFieldPitch.fill = GridBagConstraints.HORIZONTAL;
		gbc_textFieldPitch.gridx = 5;
		gbc_textFieldPitch.gridy = 2;
		panel.add(textFieldPitch, gbc_textFieldPitch);
		textFieldPitch.setColumns(15);

		lblHeight = new JLabel("Height:");
		GridBagConstraints gbc_lblHeight = new GridBagConstraints();
		gbc_lblHeight.anchor = GridBagConstraints.EAST;
		gbc_lblHeight.insets = new Insets(0, 0, 5, 5);
		gbc_lblHeight.gridx = 1;
		gbc_lblHeight.gridy = 3;
		panel.add(lblHeight, gbc_lblHeight);

		textFieldHeight = new JTextField();
		GridBagConstraints gbc_textFieldHeight = new GridBagConstraints();
		gbc_textFieldHeight.insets = new Insets(0, 0, 5, 5);
		gbc_textFieldHeight.fill = GridBagConstraints.HORIZONTAL;
		gbc_textFieldHeight.gridx = 2;
		gbc_textFieldHeight.gridy = 3;
		panel.add(textFieldHeight, gbc_textFieldHeight);
		textFieldHeight.setColumns(15);

		lblYaw = new JLabel("Yaw:");
		GridBagConstraints gbc_lblYaw = new GridBagConstraints();
		gbc_lblYaw.anchor = GridBagConstraints.EAST;
		gbc_lblYaw.insets = new Insets(0, 0, 5, 5);
		gbc_lblYaw.gridx = 4;
		gbc_lblYaw.gridy = 3;
		panel.add(lblYaw, gbc_lblYaw);

		textFieldYaw = new JTextField();
		GridBagConstraints gbc_textFieldYaw = new GridBagConstraints();
		gbc_textFieldYaw.insets = new Insets(0, 0, 5, 5);
		gbc_textFieldYaw.fill = GridBagConstraints.HORIZONTAL;
		gbc_textFieldYaw.gridx = 5;
		gbc_textFieldYaw.gridy = 3;
		panel.add(textFieldYaw, gbc_textFieldYaw);
		textFieldYaw.setColumns(15);

		textArea = new JTextArea();
		JScrollPane scrollPane = new JScrollPane(textArea);
		GridBagConstraints gbc_textArea = new GridBagConstraints();
		gbc_textArea.gridwidth = 3;
		gbc_textArea.insets = new Insets(0, 0, 5, 5);
		gbc_textArea.fill = GridBagConstraints.BOTH;
		gbc_textArea.gridx = 1;
		gbc_textArea.gridy = 3;
		frmAnppExample.getContentPane().add(scrollPane, gbc_textArea);

		// create a thread to update the available serials ports once a second
		// it is done in a new thread because under windows it can block for up
		// to 10 seconds
		Thread portScannerThread = new Thread(new PortScanner());
		portScannerThread.start();
	}

	public class PortScanner implements Runnable
	{
		public void run()
		{
			while (true)
			{
				if (!serialConnected)
				{
					SwingUtilities.invokeLater(new Runnable()
					{
						public void run()
						{
							if (!serialConnected)
							{
								String[] portNames = SerialPortList.getPortNames();
								int comboLength = comboBoxPort.getItemCount();
								if (!serialPortsAvailable) comboLength = 0;
								Boolean portsChanged = portNames.length != comboLength;
								if(!portsChanged)
								{
									for(int i = 0; i < portNames.length; i++)
									{
										if(portNames[i].compareTo((String)comboBoxPort.getItemAt(i)) != 0)
										{
											portsChanged = true;
											break;
										}
									}
								}
								if (portsChanged)
								{
									comboBoxPort.removeAllItems();
									for (int i = 0; i < portNames.length; i++)
									{
										comboBoxPort.addItem(portNames[i]);
									}
									if (portNames.length == 0)
									{
										comboBoxPort.addItem("No Serial Ports");
										comboBoxPort.setSelectedIndex(0);
										comboBoxPort.setEnabled(false);
										btnConnect.setEnabled(false);
										serialPortsAvailable = false;
									}
									else
									{
										comboBoxPort.setSelectedIndex(0);
										comboBoxPort.setEnabled(true);
										btnConnect.setEnabled(true);
										serialPortsAvailable = true;
									}
								}
							}
						}
					});
				}
				try
				{
					Thread.sleep(1000);
				}
				catch (InterruptedException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	private void serialPortClose()
	{
		try
		{
			serialPort.removeEventListener();
			serialPort.closePort();
		}
		catch (SerialPortException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		btnConnect.setText("Connect");
		serialConnected = false;
		comboBoxPort.setEnabled(true);
		comboBoxBaud.setEnabled(true);
	}

	/*
	 * This class is the event listener for received serial data
	 * Whenever serial data is received the serialEvent is called
	 * which adds the received data to the decoders buffer and then
	 * checks whether any packets can be decoded.
	 */
	public class SerialReader implements SerialPortEventListener
	{
		ANPacketDecoder packetDecoder;

		public SerialReader()
		{
			packetDecoder = new ANPacketDecoder();
		}

		public void serialEvent(SerialPortEvent event)
		{
			if (event.isRXCHAR())
			{
				try
				{
					byte[] buffer = serialPort.readBytes();
					if (buffer != null)
					{
						for (int i = 0; i < buffer.length; i++)
						{
							if (packetDecoder.bufferLength < packetDecoder.buffer.length)
							{
								packetDecoder.buffer[packetDecoder.bufferLength++] = buffer[i];
							}
						}
						
						ANPacket packet = null;
						while ((packet = packetDecoder.packetDecode()) != null)
						{
							switch (packet.id)
							{
								case ANPacket.PACKET_ID_RAW_SENSORS:
									if (packet.length == 48)
									{
										final ANPacket28 anPacket28 = new ANPacket28(packet);

										SwingUtilities.invokeLater(new Runnable()
										{
											public void run()
											{
												textArea.append("Received Raw Sensors Packet\n");
												textArea.setCaretPosition(textArea.getDocument().getLength());
											}
										});
									}
									break;
								case ANPacket.PACKET_ID_SYSTEM_STATE:
									if (packet.length == 100)
									{
										final ANPacket20 anPacket20 = new ANPacket20(packet);

										SwingUtilities.invokeLater(new Runnable()
										{
											public void run()
											{
												textArea.append("Received System State Packet\n");
												textArea.setCaretPosition(textArea.getDocument().getLength());
												textFieldLatitude.setText(Double.toString(anPacket20.position[0] * 180 / Math.PI));
												textFieldLongitude.setText(Double.toString(anPacket20.position[1] * 180 / Math.PI));
												textFieldHeight.setText(Double.toString(anPacket20.position[2]));
												textFieldRoll.setText(Double.toString(anPacket20.orientation[0] * 180 / Math.PI));
												textFieldPitch.setText(Double.toString(anPacket20.orientation[1] * 180 / Math.PI));
												textFieldYaw.setText(Double.toString(anPacket20.orientation[2] * 180 / Math.PI));

											}
										});
									}
									break;
								default:
									break;
							}
						}
					}
				}
				catch (SerialPortException exception)
				{
					System.err.println(exception.toString());
				}
			}
		}
	}
}
