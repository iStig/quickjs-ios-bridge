# 这个脚本是因为我用的是清华源 需要手动改repo 懒得改就写这个用用
import os
import shutil

# 备份原始的Podfile文件
original_file = 'Podfile'
backup_file = 'Podfile_backup'
shutil.copy(original_file, backup_file)
print("备份原始的Podfile文件完成")

# 修改Podfile文件
new_source = "source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'"
new_content = ''
with open(original_file, 'r') as file:
    lines = file.readlines()
    for line in lines:
        if line.startswith("source 'https://github.com/CocoaPods/Specs.git'"):
            new_content += new_source + "\n"
        else:
            new_content += line

with open(original_file, 'w') as file:
    file.write(new_content)
print("修改Podfile文件完成")

# 执行 pod repo update sqbpod
os.system('pod repo update sqbpod')
print("执行 pod repo update sqbpod 完成")

# 执行 pod update --verbose --no-repo-update
os.system('pod update --verbose --no-repo-update')
print("执行 pod update --verbose --no-repo-update 完成")

# 恢复原始的Podfile文件
shutil.copy(backup_file, original_file)
os.remove(backup_file)
print("恢复原始的Podfile文件完成")
