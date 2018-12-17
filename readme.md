# Overview
This repo demonstrates a weird behavior that is likely a bug in `pipenv` or some unsurfaced issue in installing the postgres binary Python drivers

# Running
```bash
docker build .
```

The expectation is the docker image builds without issue.

Instead it barfs with a stack trace about setup failing

```
Step 4/5 : RUN pipenv lock
 ---> Running in 165ef93ce1ff
Creating a virtualenv for this project…
Pipfile: /Pipfile
Using /usr/local/bin/python (3.6.7) to create virtualenv…
⠦ Creating virtual environment...Already using interpreter /usr/local/bin/python
Using base prefix '/usr/local'
New python executable in /root/.local/share/virtualenvs/-x-v5uFv0/bin/python
Installing setuptools, pip, wheel...
done.

✔ Successfully created virtual environment!
Virtualenv location: /root/.local/share/virtualenvs/-x-v5uFv0
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
⠸ Locking..✘ Locking Failed!
Traceback (most recent call last):
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 126, in <module>
    main()
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 119, in main
    parsed.requirements_dir, parsed.packages)
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 85, in _main
    requirements_dir=requirements_dir,
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 69, in resolve
    req_dir=requirements_dir
  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 726, in resolve_deps
    req_dir=req_dir,
  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 480, in actually_resolve_deps
    resolved_tree = resolver.resolve()
  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 385, in resolve
    results = self.resolver.resolve(max_rounds=environments.PIPENV_MAX_ROUNDS)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/resolver.py", line 102, in resolve
    has_changed, best_matches = self._resolve_one_round()
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/resolver.py", line 206, in _resolve_one_round
    for dep in self._iter_dependencies(best_match):
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/resolver.py", line 301, in _iter_dependencies
    dependencies = self.repository.get_dependencies(ireq)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/repositories/pypi.py", line 234, in get_dependencies
    legacy_results = self.get_legacy_dependencies(ireq)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/repositories/pypi.py", line 426, in get_legacy_dependencies
    results, ireq = self.resolve_reqs(download_dir, ireq, wheel_cache)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/repositories/pypi.py", line 297, in resolve_reqs
    results = resolver._resolve_one(reqset, ireq)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/resolve.py", line 260, in _resolve_one
    abstract_dist = self._get_abstract_dist_for(req_to_install)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/resolve.py", line 213, in _get_abstract_dist_for
    self.require_hashes
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/operations/prepare.py", line 294, in prepare_linked_requirement
    abstract_dist.prep_for_dist(finder, self.build_isolation)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/operations/prepare.py", line 127, in prep_for_dist
    self.req.run_egg_info()
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/req/req_install.py", line 474, in run_egg_info
    command_desc='python setup.py egg_info')
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/utils/misc.py", line 705, in call_subprocess
    % (command_desc, proc.returncode, cwd))
pipenv.patched.notpip._internal.exceptions.InstallationError: Command "python setup.py egg_info" failed with error code 1 in /tmp/tmpoujkak7nbuild/psycopg2-binary/
File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 126, in <module>
    main()
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 119, in main
    parsed.requirements_dir, parsed.packages)
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 85, in _main
    requirements_dir=requirements_dir,
  File "/usr/local/lib/python3.6/site-packages/pipenv/resolver.py", line 69, in resolve
    req_dir=requirements_dir
  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 726, in resolve_deps
    req_dir=req_dir,
  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 480, in actually_resolve_deps
    resolved_tree = resolver.resolve()
  File "/usr/local/lib/python3.6/site-packages/pipenv/utils.py", line 385, in resolve
    results = self.resolver.resolve(max_rounds=environments.PIPENV_MAX_ROUNDS)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/resolver.py", line 102, in resolve
    has_changed, best_matches = self._resolve_one_round()
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/resolver.py", line 206, in _resolve_one_round
    for dep in self._iter_dependencies(best_match):
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/resolver.py", line 301, in _iter_dependencies
    dependencies = self.repository.get_dependencies(ireq)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/repositories/pypi.py", line 234, in get_dependencies
    legacy_results = self.get_legacy_dependencies(ireq)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/repositories/pypi.py", line 426, in get_legacy_dependencies
    results, ireq = self.resolve_reqs(download_dir, ireq, wheel_cache)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/piptools/repositories/pypi.py", line 297, in resolve_reqs
    results = resolver._resolve_one(reqset, ireq)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/resolve.py", line 260, in _resolve_one
    abstract_dist = self._get_abstract_dist_for(req_to_install)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/resolve.py", line 213, in _get_abstract_dist_for
    self.require_hashes
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/operations/prepare.py", line 294, in prepare_linked_requirement
    abstract_dist.prep_for_dist(finder, self.build_isolation)
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/operations/prepare.py", line 127, in prep_for_dist
    self.req.run_egg_info()
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/req/req_install.py", line 474, in run_egg_info
    command_desc='python setup.py egg_info')
  File "/usr/local/lib/python3.6/site-packages/pipenv/patched/notpip/_internal/utils/misc.py", line 705, in call_subprocess
    % (command_desc, proc.returncode, cwd))
pipenv.patched.notpip._internal.exceptions.InstallationError: Command "python setup.py egg_info" failed with error code 1 in /tmp/tmpoujkak7nbuild/psycopg2-binary/
The command '/bin/sh -c pipenv lock' returned a non-zero code: 1
```