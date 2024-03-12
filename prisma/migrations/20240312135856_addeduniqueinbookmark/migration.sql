/*
  Warnings:

  - A unique constraint covering the columns `[userId,playlistId]` on the table `BookmarkedPlaylist` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `BookmarkedPlaylist_userId_playlistId_key` ON `BookmarkedPlaylist`(`userId`, `playlistId`);
