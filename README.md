## How to setup?


1. Fork this repo
2. Clone the forked version in your pc.
3. Update your configs at `cstrike/server.cfg` and also set your `rcon_password`.
4. Modify your amxmodx plugins at `cstrike/addons`
5. Update your admins at `cstrike/addons/amxmodx/configs/users.ini` and `SuperAdmin.ini`.
6. Add your maps at `cstrike/maps` and update your `cstrike/mapcycle.txt`.
7. Save the changes and push to your forked repo.
8. Go to your VPS and install docker.
9. Clone your forked repo with `git clone <YOUR_FORKED_URL>`
10. `cd <YOUR_FORKED_REPO_NAME>` cd enter your repo and run `docker-compose up -d`.

It would be done.

For managing the server via rcon, before connecting to your server from console in game, type `rcon_password <YOUR_RCON_PASSWORD_at_server.cfg>` and then connect. Then you can control server like, `rcon changelevel de_dust2_2x2` for changing map, `rcon sv_restart 1` for restarting server, etc.

You can also use amxmodx admin settings. Just connect with the admin user set at `users.ini` in amxmodx configs. Use `setinfo _pw <YOUR_AMXMODX_ADMIN_USER_PASSWORD>" before connecting. :)
