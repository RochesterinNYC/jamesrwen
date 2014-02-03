<a href="http://jamesrwen.com/" target="_blank">Personal Site</a>
-------

This is my personal site intended to better portray my personal background and experiences. Also, who doesn't like having a virtual home on the web?

The site presents a description about my current background and experiences, my previously taken and current courses, and introductions to my personal, class, and hackathon projects.

---

###Features

####Admin Accounts with Extended Features:

![Personal Site Login](http://s3.amazonaws.com/jamesrwen/var/www/jamesrwen/public/uploads/personalsitelogin_original.png?1391394575 "Personal Site Login")

Logging in with your username and password ([bcrypt](http://bcrypt-ruby.rubyforge.org/) encryption used) will allow the user to access the admin capabilities and dashboard, all of which are integrated into the page views and sidebar.

![Personal Site Admin](http://s3.amazonaws.com/jamesrwen/var/www/jamesrwen/public/uploads/personalsiteadmin_original.png?1391394552 "Personal Site Admin")

Admin Capabilities include:
- Creating new Projects and their views (markdown content)
- Editing existing Projects
- Uploading files and attachments
- Creating and editing blog posts

![Personal Site New Project](http://s3.amazonaws.com/jamesrwen/var/www/jamesrwen/public/uploads/personalsitenewproject_original.png?1391394598 "Personal Site New Project")

---

####User-friendly Project URLs:

Projects are given friendly url routes that act as descriptive nicknames or handles. Implemented with [FriendlyId](https://github.com/norman/friendly_id) gem.
Ex:

    http://jameswen.herokuapp.com/projects/jamesrwen/edit
    http://jameswen.herokuapp.com/projects/jamesrwen/

---

####Markdown Content Integration:

All of the project introductions/views are Markdown content. The Project editor also includes a Markdown editor that can render in-page previews of your Markdown content. Rendering for all Markdown is incorporated through the [Redcarpet](https://github.com/vmg/redcarpet) gem.

![Personal Site Markdown](http://s3.amazonaws.com/jamesrwen/var/www/jamesrwen/public/uploads/personalsitemarkdown_original.png?1391394605 "Personal Site Markdown")

---

####File Uploads and Attachments:

Projects have associated image and source code attachments that are previewed in the Project edit views. Due to the way that images are separately referenced/rendered in the Markdown content sections, this attachment system is being deprecated in favor of a general file upload system where all uploaded files are simply uploads that anything can reference. Uploads are implemented with the [Paperclip](https://github.com/thoughtbot/paperclip) gem and [AWS-SDK](https://github.com/aws/aws-sdk-ruby).

![Personal Site Project Attachments](http://s3.amazonaws.com/jamesrwen/var/www/jamesrwen/public/uploads/personalsiteattachments_original.png?1391394591 "Personal Site Project Attachments")

---

###Pending Features
- Blog Post Migration
- Altering system to replace project attachments with general file uploads and associated gallery
- Code Highlighting in markdown content and blog posts
- Tagging System for posts and uploads
- Comment system on Posts (and maybe uploads?)