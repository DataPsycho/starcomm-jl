server = @async StarComm.run()

msg1 = StarComm.Client.send_message("Saru", "Captain Saru to Discovery, Over!")
msg2 = StarComm.Client.send_message_threaded("Saru", "Captain Saru to Discovery, Over!")