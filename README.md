**Procedures for editing mission files:**

**If editing files stored in repository**
1. Edit desired files
2. Build miz (using build process)
3. Test the miz
4. Once satisfied that the miz is working, then commit the files


How to build

Clone the repo to your local filesystem.  Example:
```
git commit 
```
Make your changes.
Then review, stage, commit, and push.  Example (items within <> should not contain 
'<>' but rather are exmaples of generic items:
```
git status
git add <your changed files>
git rm <your removed files>
git commit -m "some coherent comment about your changes"
git push
```

**Procedures for change mission miz files within the DCS Mission Editor:**
1. Obtain "the latest" miz file
2. Place it somewhere where DCS can open it, and open within the Misiion Mission Editor
3. Make you edits
4. Save your miz file
5. Unzip the miz file (using a tool like 7zip) and copy and past the files into the NTTR directory, and thus overwriting the mission files
6. Examine the files changes prior to commit, and to the extent possible, ensure that the changes make sense.  It is possible that the changes are too complex to comprehend, depending on the changes that the mission editor made.
7. Commit your changes to the repo.
8. Push the changes up to the origin (on github).

   