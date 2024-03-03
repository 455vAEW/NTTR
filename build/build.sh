o "Building TRM-455-x.y.z.miz ..."

# Adjust the path to the 7z.exe file according to your installation
PRG_7ZIP='/drives/c/Program Files/7-Zip/7z.exe'

# Check if 7-Zip is installed and accessible
if [ ! -f "$PRG_7ZIP" ]; then
    echo "7-Zip executable not found at $PRG_7ZIP. Please ensure 7-Zip is installed and the path is correct."
    exit 1
else
    echo "Using PRG_7ZIP = $PRG_7ZIP"
fi

MISSION_FILE="NTTR-455-latest.miz"
# Copying the dummy.miz to the mission file. Ensure dummy.miz exists in your current directory.
cp dummy.miz "$MISSION_FILE"

# Executing 7-Zip command to archive, excluding specific patterns
"$PRG_7ZIP" a -bb0 "$MISSION_FILE" ./* -xr!.git* -x!*.miz -x!*.yml -x!.save -x!readme.md -x!build -x!*.code-workspace

# Conditional renaming based on the APPVEYOR_REPO_TAG environment variable
# This part assumes you have these environment variables set up in your environment.
# Adjust or remove this part based on your actual use case.
if [ "$APPVEYOR_REPO_TAG" == "true" ]; then
    mv dummy.miz "TRM_${APPVEYOR_REPO_TAG_NAME}.miz"
else
    mv dummy.miz "TRM_${APPVEYOR_BUILD_VERSION}.miz"
fi

